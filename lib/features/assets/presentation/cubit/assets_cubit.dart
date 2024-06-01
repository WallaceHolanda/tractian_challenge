import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian_challenge/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/filtro_params.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/location_entity.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_assets_usecase.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_locations_usecase.dart';
import 'package:tractian_challenge/features/assets/presentation/itens_mock.dart';

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

  List<ItemEntity> itensTotais = [];

  Future<void> obterItens(String companyId) async {
    emit(AssetsCarregando());
    try {
      final respostas = await Future.wait([
        _obterAssetsUsecase(companyId),
        _obterLocationsUsecase(companyId),
      ]);

      respostas[0].fold(
        (_) => emit(AssetsErro()),
        (assets) {
          respostas[1].fold(
            (_) => emit(AssetsErro()),
            (loations) {
              itensTotais = mockItems;
              emit(AssetsSucesso(itens: mockItems));
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
          itens: itensTotais,
          filtro: filtro,
        );
        emit(AssetsSucesso(itens: itensFiltrados));
      } else {
        emit(AssetsSucesso(itens: itensTotais));
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
