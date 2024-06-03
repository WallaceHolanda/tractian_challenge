import 'package:tractian_challenge/features/assets/data/datasource/assets_local_datasource.dart';
import 'package:tractian_challenge/features/assets/data/datasource/i_assets_datasource.dart';
import 'package:tractian_challenge/features/assets/data/repository/assets_repository_impl.dart';
import 'package:tractian_challenge/features/assets/domain/repository/i_assets_repository.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_assets_usecase.dart';
import 'package:tractian_challenge/features/assets/domain/usecases/obter_locations_usecase.dart';
import 'package:tractian_challenge/features/assets/presentation/cubit/assets_cubit.dart';
import 'package:tractian_challenge/features/companies/data/datasource/company_local_datasource.dart';
import 'package:tractian_challenge/features/companies/data/datasource/i_company_datasource.dart';
import 'package:tractian_challenge/features/companies/data/repository/company_repository_impl.dart';
import 'package:tractian_challenge/features/companies/domain/repository/i_company_repository.dart';
import 'package:tractian_challenge/features/companies/domain/usecases/obter_companies_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:tractian_challenge/features/companies/presentation/cubit/companies_cubit.dart';

class AppDependencia {
  final dependencia = GetIt.instance;

  Future<void> inicializar() async {
    dependencia.registerLazySingleton<ICompanyDatasource>(
      () => CompanyLocalDatasource(),
    );

    dependencia.registerLazySingleton<IAssetsDatasource>(
      () => AssetsLocalDatasource(),
    );

    dependencia.registerLazySingleton<ICompanyRepository>(
      () => CompanyRepositoryImpl(dependencia()),
    );

    dependencia.registerLazySingleton<IAssetsRepository>(
      () => AssetsRepositoryImpl(dependencia()),
    );

    dependencia.registerLazySingleton(
      () => ObterCompaniesUsecase(dependencia()),
    );

    dependencia.registerLazySingleton(
      () => ObterLocationsUsecase(dependencia()),
    );

    dependencia.registerLazySingleton(
      () => ObterAssetsUsecase(dependencia()),
    );

    dependencia.registerFactory(
      () => CompaniesCubit(dependencia()),
    );

    dependencia.registerFactory(
      () => AssetsCubit(
        obterAssetsUsecase: dependencia(),
        obterLocationsUsecase: dependencia(),
      ),
    );
  }
}
