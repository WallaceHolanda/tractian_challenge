import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/companies/domain/repository/i_company_repository.dart';
import 'package:tractian_challenge/features/companies/domain/usecases/obter_companies_usecase.dart';

import '../../utils/companies_utils.dart';

class MockCompanyRepository extends Mock implements ICompanyRepository {}

void main() {
  late MockCompanyRepository repository;
  late ObterCompaniesUsecase usecase;

  setUp(() {
    repository = MockCompanyRepository();
    usecase = ObterCompaniesUsecase(repository);
  });

  test('Deve retornar uma lista de companies', () async {
    when(() => repository.obterCompanies()).thenAnswer(
      (_) async => Right(tCompanyList),
    );

    final resultado = await usecase();
    expect(resultado, Right(tCompanyList));
  });

  test('Deve retornar um LocalFailure caso acorra algum erro na obtenção',
      () async {
    when(() => repository.obterCompanies()).thenAnswer(
      (_) async => Left(LocalFailure()),
    );

    final resultado = await usecase();
    expect(resultado, Left(LocalFailure()));
  });
}
