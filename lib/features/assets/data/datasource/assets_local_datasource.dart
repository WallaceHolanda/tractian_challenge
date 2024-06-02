import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tractian_challenge/core/assets/local_data_enum.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/assets/data/datasource/i_assets_datasource.dart';

class AssetsLocalDatasource implements IAssetsDatasource {
  @override
  Future<Map<String, dynamic>> obterAssets(String companyId) async {
    try {
      String jsonString = await rootBundle.loadString(
        LocalDataEnum.assets.caminho,
      );

      final assets = jsonDecode(jsonString);

      for (final asset in assets) {
        if (asset["id"] == companyId) {
          return {"data": asset["assets"]};
        }
      }

      return {"data": []};
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure();
    }
  }

  @override
  Future<Map<String, dynamic>> obterLocations(String companyId) async {
    try {
      String jsonString = await rootBundle.loadString(
        LocalDataEnum.locations.caminho,
      );

      final locations = jsonDecode(jsonString);

      for (final location in locations) {
        if (location["id"] == companyId) {
          return {"data": location["locations"]};
        }
      }

      return {"data": []};
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure();
    }
  }
}
