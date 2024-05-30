import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/location_entity.dart';

abstract class IAssetsRepository {
  Future<Either<Failure, List<AssetEntity>>> obterAssets(String companyId);
  Future<Either<Failure, List<LocationEntity>>> obterLocations(
    String companyId,
  );
}
