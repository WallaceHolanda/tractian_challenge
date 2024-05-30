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

    dependencia.registerLazySingleton<IEmpresaRepository>(
      () => EmpresaRepositoryImpl(dependencia()),
    );

    dependencia.registerLazySingleton(
      () => ObterEmpresasUsecase(dependencia()),
    );

    dependencia.registerFactory(
      () => EmpresasCubit(dependencia()),
    );
  }
}
