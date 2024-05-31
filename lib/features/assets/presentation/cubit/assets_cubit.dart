import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';
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

  List<ItemEntity> itens = [];

  Future<void> obterItens(String companyId) async {
    emit(AssetsCarregando());

    final respostas = await Future.wait([
      _obterAssetsUsecase(companyId),
      _obterLocationsUsecase(companyId),
    ]);

    respostas[0].fold(
      (_) => emit(AssetsErro()),
      (assets) {
        respostas[1].fold(
          (_) => emit(AssetsErro()),
          (loations) => emit(AssetsSucesso()),
        );
      },
    );
  }
}
