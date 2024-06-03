import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/assets/data/datasource/i_assets_datasource.dart';
import 'package:tractian_challenge/features/assets/data/repository/assets_repository_impl.dart';

import '../utils/assets_utils.dart';

class MockAssetsDatasource extends Mock implements IAssetsDatasource {}

void main() {
  late MockAssetsDatasource datasource;
  late AssetsRepositoryImpl repository;

  setUp(() {
    datasource = MockAssetsDatasource();
    repository = AssetsRepositoryImpl(datasource);
  });

  group('Testes do Método obterLocations()', () {
    test("""Deve retornar uma lista de locations quando o datasource retornar 
    uma resposta com dados""", () async {
      when(() => datasource.obterLocations(tCompanyId)).thenAnswer(
        (_) async => tLocationResponse,
      );

      final result = await repository.obterLocations(tCompanyId);
      expect(result.isRight(), true);
    });

    test("""Deve retornar uma lista vazia quando o datasource retornar 
    uma resposta sem dados""", () async {
      when(() => datasource.obterLocations(tCompanyId)).thenAnswer(
        (_) async => tSemDadosResponse,
      );

      final result = await repository.obterLocations(tCompanyId);
      expect(result.isRight(), true);
    });

    test("""Deve retornar uma Failure quando o datasource retornar uma resposta 
    incorreta""", () async {
      when(() => datasource.obterLocations(tCompanyId)).thenAnswer(
        (_) async => tBadResponse,
      );

      final result = await repository.obterLocations(tCompanyId);
      expect(result.isLeft(), true);
    });

    test("""Deve retornar uma Failure quando houver algum problema no retorno
    do datasource""", () async {
      when(() => datasource.obterLocations(tCompanyId)).thenAnswer(
        (_) async => throw LocalFailure(),
      );

      final result = await repository.obterLocations(tCompanyId);
      expect(result.isLeft(), true);
    });
  });

  group('Testes do Método obterAssets()', () {
    test("""Deve retornar uma lista de assets quando o datasource retornar 
    uma resposta com dados""", () async {
      when(() => datasource.obterAssets(tCompanyId)).thenAnswer(
        (_) async => tAssetResponse,
      );

      final result = await repository.obterAssets(tCompanyId);
      expect(result.isRight(), true);
    });

    test("""Deve retornar uma lista vazia quando o datasource retornar 
    uma resposta sem dados""", () async {
      when(() => datasource.obterAssets(tCompanyId)).thenAnswer(
        (_) async => tSemDadosResponse,
      );

      final result = await repository.obterAssets(tCompanyId);
      expect(result.isRight(), true);
    });

    test("""Deve retornar uma Failure quando o datasource retornar uma resposta 
    incorreta""", () async {
      when(() => datasource.obterAssets(tCompanyId)).thenAnswer(
        (_) async => tBadResponse,
      );

      final result = await repository.obterAssets(tCompanyId);
      expect(result.isLeft(), true);
    });

    test("""Deve retornar uma Failure quando houver algum problema no retorno
    do datasource""", () async {
      when(() => datasource.obterAssets(tCompanyId)).thenAnswer(
        (_) async => throw LocalFailure(),
      );

      final result = await repository.obterAssets(tCompanyId);
      expect(result.isLeft(), true);
    });
  });
}
