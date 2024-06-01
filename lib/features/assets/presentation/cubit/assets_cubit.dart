import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
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

  // Trocar o filtro pelo filtro params
  Future<void> filtrarItens(String filtro) async {
    try {
      if (filtro.isNotEmpty) {
        emit(AssetsFiltroCarregando());
        final itensFiltrados = _fitrarItens(itensTotais, filtro);
        emit(AssetsSucesso(itens: itensFiltrados));
      } else {
        emit(AssetsSucesso(itens: itensTotais));
      }
    } catch (e) {
      emit(AssetsErro());
    }
  }

  List<ItemEntity> _fitrarItens(List<ItemEntity> itens, String filtro) {
    List<ItemEntity> itensFiltrados = [];

    for (var item in itens) {
      List<ItemEntity> filteredChildren = _fitrarItens(item.itens, filtro);

      if (item.name.toLowerCase().contains(filtro.toLowerCase()) ||
          filteredChildren.isNotEmpty) {
        itensFiltrados.add(
          ItemEntity(
            id: item.id,
            name: item.name,
            itens: filteredChildren,
            parentId: item.parentId,
          ),
        );
      }
    }

    return itensFiltrados;
  }
}
