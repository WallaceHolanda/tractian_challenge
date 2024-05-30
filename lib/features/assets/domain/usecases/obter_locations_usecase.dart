import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/assets/domain/entities/location_entity.dart';
import 'package:tractian_challenge/features/assets/domain/repository/i_assets_repository.dart';

class ObterLocationsUsecase {
  final IAssetsRepository _repository;

  ObterLocationsUsecase(IAssetsRepository repository)
      : _repository = repository;

  Future<Either<Failure, List<LocationEntity>>> call(String companyId) async {
    return _repository.obterLocations(companyId);
  }
}
