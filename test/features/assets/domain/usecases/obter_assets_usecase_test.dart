import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/assets/domain/repository/i_assets_repository.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_assets_usecase.dart';

import '../../utils/assets_utils.dart';

class MockAssetsRepository extends Mock implements IAssetsRepository {}

void main() {
  late MockAssetsRepository repository;
  late ObterAssetsUsecase usecase;

  setUp(() {
    repository = MockAssetsRepository();
    usecase = ObterAssetsUsecase(repository);
  });

  test('Deve retornar uma lista de assets', () async {
    when(() => repository.obterAssets(tCompanyId)).thenAnswer(
      (_) async => Right(tAssetList),
    );

    final resultado = await usecase(tCompanyId);
    expect(resultado, Right(tAssetList));
  });

  test('Deve retornar um LocalFailure caso acorra algum erro na obtenção',
      () async {
    when(() => repository.obterAssets(tCompanyId)).thenAnswer(
      (_) async => Left(LocalFailure()),
    );

    final resultado = await usecase(tCompanyId);
    expect(resultado, Left(LocalFailure()));
  });
}
