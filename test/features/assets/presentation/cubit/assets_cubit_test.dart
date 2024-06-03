import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_assets_usecase.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_locations_usecase.dart';
import 'package:tractian_challenge/features/assets/presentation/cubit/assets_cubit.dart';

import '../../utils/assets_utils.dart';

class MockObterAssetsUsecase extends Mock implements ObterAssetsUsecase {}

class MockObterLocationsUsecase extends Mock implements ObterLocationsUsecase {}

void main() {
  late ObterAssetsUsecase obterAssetsUsecase;
  late ObterLocationsUsecase obterLocationsUsecase;
  late AssetsCubit cubit;

  setUp(() {
    obterAssetsUsecase = MockObterAssetsUsecase();
    obterLocationsUsecase = MockObterLocationsUsecase();
    cubit = AssetsCubit(
      obterAssetsUsecase: obterAssetsUsecase,
      obterLocationsUsecase: obterLocationsUsecase,
    );
  });

  tearDown(() {
    cubit.close();
  });

  test('Deve emitir o estado inicial', () {
    expect(cubit.state, AssetsInitial());
  });

  group('Testes do método obterItens()', () {
    blocTest<AssetsCubit, AssetsState>(
      'Deve emitir [Carregando, Sucesso] quando os itens forem obtidos',
      build: () {
        when(() => obterAssetsUsecase(tCompanyId)).thenAnswer(
          (_) async => Right(tAssetList),
        );
        when(() => obterLocationsUsecase(tCompanyId)).thenAnswer(
          (_) async => Right(tLocationList),
        );
        return cubit;
      },
      act: (cubit) async {
        await cubit.obterItens(tCompanyId);
      },
      expect: () => [
        isA<AssetsCarregando>(),
        isA<AssetsSucesso>(),
      ],
    );

    blocTest<AssetsCubit, AssetsState>(
      'Deve emitir [Carregando, Erro] quando retornar erro ao obter os assets',
      build: () {
        when(() => obterAssetsUsecase(tCompanyId)).thenAnswer(
          (_) async => Left(LocalFailure()),
        );
        when(() => obterLocationsUsecase(tCompanyId)).thenAnswer(
          (_) async => Right(tLocationList),
        );
        return cubit;
      },
      act: (cubit) async {
        await cubit.obterItens(tCompanyId);
      },
      expect: () => <dynamic>[
        isA<AssetsCarregando>(),
        isA<AssetsErro>(),
      ],
    );

    blocTest<AssetsCubit, AssetsState>(
      'Deve emitir [Carregando, Erro] quando retornar erro ao obter as locations',
      build: () {
        when(() => obterAssetsUsecase(tCompanyId)).thenAnswer(
          (_) async => Right(tAssetList),
        );
        when(() => obterLocationsUsecase(tCompanyId)).thenAnswer(
          (_) async => Left(LocalFailure()),
        );
        return cubit;
      },
      act: (cubit) async {
        await cubit.obterItens(tCompanyId);
      },
      expect: () => <dynamic>[
        isA<AssetsCarregando>(),
        isA<AssetsErro>(),
      ],
    );

    blocTest<AssetsCubit, AssetsState>(
      'Deve emitir [Carregando, SemDados] quando não existirem itens',
      build: () {
        when(() => obterAssetsUsecase(tCompanyId)).thenAnswer(
          (_) async => const Right([]),
        );
        when(() => obterLocationsUsecase(tCompanyId)).thenAnswer(
          (_) async => const Right([]),
        );
        return cubit;
      },
      act: (cubit) async {
        await cubit.obterItens(tCompanyId);
      },
      expect: () => [
        isA<AssetsCarregando>(),
        isA<AssetsSemDados>(),
      ],
    );
  });

  group('Testes do método filtrarItens()', () {
    blocTest<AssetsCubit, AssetsState>(
      'Deve emitir [CarregandoFiltro, Sucesso] houver filtro de itens',
      build: () => cubit,
      act: (cubit) async {
        await cubit.filtrarItens(tComFiltro);
      },
      expect: () => [
        isA<AssetsFiltroCarregando>(),
        isA<AssetsSucesso>(),
      ],
    );

    blocTest<AssetsCubit, AssetsState>(
      'Deve emitir [CarregandoFiltro, Sucesso] houver não filtro de itens',
      build: () => cubit,
      act: (cubit) async {
        await cubit.filtrarItens(tSemFiltro);
      },
      expect: () => [
        isA<AssetsFiltroCarregando>(),
        isA<AssetsSucesso>(),
      ],
    );
  });
}
