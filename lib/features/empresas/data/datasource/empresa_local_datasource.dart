import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tractian_challenge/core/assets/local_data_enum.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/empresas/data/datasource/i_empresa_datasource.dart';

class EmpresaLocalDatasource implements IEmpresaDatasource {
  @override
  Future<Map<String, dynamic>> obterEmpresas() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      String jsonString = await rootBundle.loadString(
        LocalDataEnum.companies.caminho,
      );
      return {"data": jsonDecode(jsonString)};
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure();
    }
  }
}
