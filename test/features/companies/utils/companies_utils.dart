import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/companies/domain/entities/company_entity.dart';

const tCompaniesResponse = {
  "data": [
    {"id": "1", "name": "Jaguar Unit"},
    {"id": "2", "name": "Tobias Unit"},
    {"id": "3", "name": "Apex Unit"}
  ]
};

const tCompanyList = [
  CompanyEntity(id: "1", name: "Jaguar Unit"),
  CompanyEntity(id: "2", name: "Tobias Unit"),
  CompanyEntity(id: "3", name: "Apex Unit"),
];

final tLocalFailure = LocalFailure();
