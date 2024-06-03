import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/companies/domain/entities/company_entity.dart';
import 'package:tractian_challenge/features/companies/domain/repository/i_company_repository.dart';

class ObterCompaniesUsecase {
  final ICompanyRepository _repository;

  ObterCompaniesUsecase(ICompanyRepository repository)
      : _repository = repository;

  Future<Either<Failure, List<CompanyEntity>>> call() async {
    return _repository.obterCompanies();
  }
}
