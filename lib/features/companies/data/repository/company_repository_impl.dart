import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/companies/data/datasource/i_company_datasource.dart';
import 'package:tractian_challenge/features/companies/data/models/company_model.dart';
import 'package:tractian_challenge/features/companies/domain/entities/company_entity.dart';
import 'package:tractian_challenge/features/companies/domain/repository/i_company_repository.dart';

class CompanyRepositoryImpl implements ICompanyRepository {
  final ICompanyDatasource _datasource;

  CompanyRepositoryImpl(ICompanyDatasource datasource)
      : _datasource = datasource;

  @override
  Future<Either<Failure, List<CompanyEntity>>> obterCompanies() async {
    try {
      final response = await _datasource.obterCompanies();

      if (response['data'] != null && response['data'].isNotEmpty) {
        final dados = response['data'] as List;
        final companies =
            dados.map((company) => CompanyModel.fromMap(company)).toList();
        return Right(companies);
      }
      return const Right([]);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (_) {
      return Left(LocalFailure());
    }
  }
}
