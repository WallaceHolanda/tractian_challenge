import 'package:tractian_challenge/features/assets/data/datasource/assets_local_datasource.dart';
import 'package:tractian_challenge/features/assets/data/datasource/i_assets_datasource.dart';
import 'package:tractian_challenge/features/assets/data/repository/assets_repository_impl.dart';
import 'package:tractian_challenge/features/assets/domain/repository/i_assets_repository.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_assets_usecase.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_locations_usecase.dart';
import 'package:tractian_challenge/features/assets/presentation/cubit/assets_cubit.dart';
import 'package:tractian_challenge/features/empresas/data/datasource/empresa_local_datasource.dart';
import 'package:tractian_challenge/features/empresas/data/datasource/i_empresa_datasource.dart';
import 'package:tractian_challenge/features/empresas/data/repository/empresa_repository_impl.dart';
import 'package:tractian_challenge/features/empresas/domain/repository/i_empresa_repository.dart';
import 'package:tractian_challenge/features/empresas/domain/usecases/obter_empresas_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:tractian_challenge/features/empresas/presentation/cubit/empresas_cubit.dart';

class AppDependencia {
  final dependencia = GetIt.instance;

  Future<void> inicializar() async {
    dependencia.registerLazySingleton<IEmpresaDatasource>(
      () => EmpresaLocalDatasource(),
    );

    dependencia.registerLazySingleton<IAssetsDatasource>(
      () => AssetsLocalDatasource(),
    );

    dependencia.registerLazySingleton<IEmpresaRepository>(
      () => EmpresaRepositoryImpl(dependencia()),
    );

    dependencia.registerLazySingleton<IAssetsRepository>(
      () => AssetsRepositoryImpl(dependencia()),
    );

    dependencia.registerLazySingleton(
      () => ObterEmpresasUsecase(dependencia()),
    );

    dependencia.registerLazySingleton(
      () => ObterLocationsUsecase(dependencia()),
    );

    dependencia.registerLazySingleton(
      () => ObterAssetsUsecase(dependencia()),
    );

    dependencia.registerFactory(
      () => EmpresasCubit(dependencia()),
    );

    dependencia.registerFactory(
      () => AssetsCubit(
        obterAssetsUsecase: dependencia(),
        obterLocationsUsecase: dependencia(),
      ),
    );
  }
}
