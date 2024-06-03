import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/companies/data/datasource/i_company_datasource.dart';
import 'package:tractian_challenge/features/companies/data/repository/company_repository_impl.dart';

import '../../utils/companies_utils.dart';

class MockCompaniesDatasource extends Mock implements ICompanyDatasource {}

void main() {
  late MockCompaniesDatasource datasource;
  late CompanyRepositoryImpl repository;

  setUp(() {
    datasource = MockCompaniesDatasource();
    repository = CompanyRepositoryImpl(datasource);
  });

  group('Testes do Método obterCompanies()', () {
    test("""Deve retornar uma lista de companies quando o datasource restorar 
    uma resposta com dados""", () async {
      when(() => datasource.obterCompanies()).thenAnswer(
        (_) async => tCompaniesResponse,
      );

      final result = await repository.obterCompanies();
      expect(result.isRight(), true);
    });

    test("""Deve retornar uma Failure quando houver algum problema no retorno
    do datasource""", () async {
      when(() => datasource.obterCompanies()).thenAnswer(
        (_) async => throw LocalFailure(),
      );

      final result = await repository.obterCompanies();
      expect(result.isLeft(), true);
    });
  });
}
