import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/features/companies/domain/usecases/obter_companies_usecase.dart';
import 'package:tractian_challenge/features/companies/presentation/cubit/companies_cubit.dart';

import '../../utils/companies_utils.dart';

class MockObterCompaniesUsecase extends Mock implements ObterCompaniesUsecase {}

void main() {
  late MockObterCompaniesUsecase usecase;
  late CompaniesCubit cubit;

  setUp(() {
    usecase = MockObterCompaniesUsecase();
    cubit = CompaniesCubit(usecase);
  });

  tearDown(() {
    cubit.close();
  });

  test('Deve emitir o estado inicial', () {
    expect(cubit.state, CompaniesInitial());
  });

  blocTest<CompaniesCubit, CompaniesState>(
    'Deve emitir [Carregando, Sucesso] quando as companies forem obtidas',
    build: () {
      when(() => usecase()).thenAnswer((_) async => const Right(tCompanyList));
      return cubit;
    },
    act: (cubit) async {
      await cubit.obterCompanies();
    },
    expect: () => [
      isA<CompaniesCarregando>(),
      isA<CompaniesSucesso>(),
    ],
  );

  blocTest<CompaniesCubit, CompaniesState>(
    'Deve emitir [Carregando, Erro] quando retornar erro',
    build: () {
      when(() => usecase()).thenAnswer((_) async => Left(tLocalFailure));
      return cubit;
    },
    act: (cubit) async {
      await cubit.obterCompanies();
    },
    expect: () => <dynamic>[
      isA<CompaniesCarregando>(),
      isA<CompaniesErro>(),
    ],
  );
}
