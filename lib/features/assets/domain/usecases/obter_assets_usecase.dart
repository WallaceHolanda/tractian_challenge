import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_challenge/features/assets/domain/repository/i_assets_repository.dart';

class ObterAssetsUsecase {
  final IAssetsRepository _repository;

  ObterAssetsUsecase(IAssetsRepository repository) : _repository = repository;

  Future<Either<Failure, List<AssetEntity>>> call(String companyId) async {
    return _repository.obterAssets(companyId);
  }
}
