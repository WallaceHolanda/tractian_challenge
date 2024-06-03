import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/companies/domain/entities/company_entity.dart';

abstract class ICompanyRepository {
  Future<Either<Failure, List<CompanyEntity>>> obterCompanies();
}
