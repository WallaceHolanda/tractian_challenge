import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/assets/domain/repository/i_assets_repository.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_locations_usecase.dart';

import '../../utils/assets_utils.dart';

class MockAssetsRepository extends Mock implements IAssetsRepository {}

void main() {
  late MockAssetsRepository repository;
  late ObterLocationsUsecase usecase;

  setUp(() {
    repository = MockAssetsRepository();
    usecase = ObterLocationsUsecase(repository);
  });

  test('Deve retornar uma lista de locations', () async {
    when(() => repository.obterLocations(tCompanyId)).thenAnswer(
      (_) async => Right(tLocationList),
    );

    final resultado = await usecase(tCompanyId);
    expect(resultado, Right(tLocationList));
  });

  test('Deve retornar um LocalFailure caso acorra algum erro na obtenção',
      () async {
    when(() => repository.obterLocations(tCompanyId)).thenAnswer(
      (_) async => Left(LocalFailure()),
    );

    final resultado = await usecase(tCompanyId);
    expect(resultado, Left(LocalFailure()));
  });
}
