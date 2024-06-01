import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/assets/data/datasource/i_assets_datasource.dart';
import 'package:tractian_challenge/features/assets/data/models/asset_model.dart';
import 'package:tractian_challenge/features/assets/data/models/location_model.dart';
import 'package:tractian_challenge/features/assets/domain/entities/asset_entity.dart';
import 'package:tractian_challenge/features/assets/domain/entities/location_entity.dart';
import 'package:tractian_challenge/features/assets/domain/repository/i_assets_repository.dart';

class AssetsRepositoryImpl implements IAssetsRepository {
  final IAssetsDatasource _datasource;

  AssetsRepositoryImpl(final IAssetsDatasource datasource)
      : _datasource = datasource;

  @override
  Future<Either<Failure, List<AssetEntity>>> obterAssets(
    String companyId,
  ) async {
    try {
      final response = await _datasource.obterAssets(companyId);
      if (response["data"] != null && response["data"].isNotEmpty) {
        final dados = response["data"] as List;
        final assets = dados.map((asset) => AssetModel.fromMap(asset)).toList();
        return Right(assets);
      }
      return const Right([]);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      debugPrint(e.toString());
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> obterLocations(
    String companyId,
  ) async {
    try {
      final response = await _datasource.obterAssets(companyId);
      if (response["data"] != null && response["data"].isNotEmpty) {
        final dados = response["data"] as List;
        final locations =
            dados.map((location) => LocationModel.fromMap(location)).toList();
        return Right(locations);
      }
      return const Right([]);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      debugPrint(e.toString());
      return Left(LocalFailure());
    }
  }
}
