import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/filtro_params.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/location_entity.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_assets_usecase.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_locations_usecase.dart';

part 'assets_state.dart';

class AssetsCubit extends Cubit<AssetsState> {
  final ObterAssetsUsecase _obterAssetsUsecase;
  final ObterLocationsUsecase _obterLocationsUsecase;

  AssetsCubit({
    required ObterAssetsUsecase obterAssetsUsecase,
    required ObterLocationsUsecase obterLocationsUsecase,
  })  : _obterAssetsUsecase = obterAssetsUsecase,
        _obterLocationsUsecase = obterLocationsUsecase,
        super(AssetsInitial());

  List<ItemEntity> _itensTotais = [];

  Future<void> obterItens(String companyId) async {
    emit(AssetsCarregando());
    try {
      final respostas = await Future.wait([
        _obterAssetsUsecase(companyId),
        _obterLocationsUsecase(companyId),
      ]);

      final assetsResposta = respostas[0] as Either<Failure, List<AssetEntity>>;
      final locationsResposta =
          respostas[1] as Either<Failure, List<LocationEntity>>;

      assetsResposta.fold(
        (_) => emit(AssetsErro()),
        (assets) {
          locationsResposta.fold(
            (_) => emit(AssetsErro()),
            (locations) {
              Map<String, LocationEntity> locationMap = {};
              Map<String, AssetEntity> assetMap = {};

              // Cria Mapa de Locations
              for (final location in locations) {
                locationMap[location.id] = location;
              }

              // Cria Mapa de Assets
              for (final asset in assets) {
                if (asset.isComponentUnico) {
                  _itensTotais.add(asset);
                } else {
                  assetMap[asset.id] = asset;
                }
              }

              // Adiciona Componentes e Sub-Assets
              for (final asset in assets) {
                if (asset.parentId != null &&
                    assetMap.containsKey(asset.parentId)) {
                  assetMap[asset.parentId]!.itens.add(asset);
                }
              }

              // Adiciona Assets aos Locations ou Sub-Locations
              assetMap.forEach((_, asset) {
                if (asset.locationId != null &&
                    asset.parentId == null &&
                    locationMap.containsKey(asset.locationId)) {
                  locationMap[asset.locationId]!.itens.add(asset);
                }

                // Caso seja um asset individual e sem parentes
                if (asset.locationId == null &&
                    asset.parentId == null &&
                    !asset.isComponent) {
                  _itensTotais.add(asset);
                }
              });

              // Adiciona Sub-Locations aos Location
              for (final location in locations) {
                if (location.parentId != null &&
                    locationMap.containsKey(location.parentId)) {
                  locationMap[location.parentId]!.itens.add(location);
                }
              }

              // Adiciona Itens na Lista
              locationMap.forEach((_, location) {
                if (location.parentId == null) {
                  _itensTotais.add(location);
                }
              });

              _itensTotais = _itensTotais.reversed.toList();
              emit(AssetsSucesso(itens: _itensTotais));
            },
          );
        },
      );
    } catch (_) {
      emit(AssetsErro());
    }
  }

  Future<void> filtrarItens(FiltroParams filtro) async {
    try {
      if (filtro.isFiltroAtivo) {
        emit(AssetsFiltroCarregando());
        final itensFiltrados = _fitrarItens(
          itens: _itensTotais,
          filtro: filtro,
        );
        emit(AssetsSucesso(itens: itensFiltrados));
      } else {
        emit(AssetsSucesso(itens: _itensTotais));
      }
    } catch (e) {
      emit(AssetsErro());
    }
  }

  List<ItemEntity> _fitrarItens({
    required List<ItemEntity> itens,
    required FiltroParams filtro,
  }) {
    List<ItemEntity> itensFiltrados = [];

    for (var item in itens) {
      List<ItemEntity> nosFilho = _fitrarItens(
        itens: item.itens,
        filtro: filtro,
      );

      bool statusCritico = !filtro.isCritico;
      bool sensorEnergia = !filtro.isSensorEnergia;
      bool possuiString = filtro.nome.isEmpty ||
          item.name.toLowerCase().contains(
                filtro.nome.toLowerCase(),
              );

      if (item is AssetEntity) {
        if (filtro.isCritico) {
          statusCritico = item.isCritico;
        }

        if (filtro.isSensorEnergia) {
          sensorEnergia = item.isSensorEnergia;
        }
      }

      if ((possuiString && statusCritico && sensorEnergia) ||
          nosFilho.isNotEmpty) {
        itensFiltrados.add(
          item is AssetEntity
              ? AssetEntity(
                  id: item.id,
                  name: item.name,
                  parentId: item.parentId,
                  locationId: item.locationId,
                  sensorType: item.sensorType,
                  status: item.status,
                  itens: nosFilho,
                )
              : LocationEntity(
                  id: item.id,
                  name: item.name,
                  parentId: item.parentId,
                  itens: nosFilho,
                ),
        );
      }
    }

    return itensFiltrados;
  }
}
