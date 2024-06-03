import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/companies/domain/entities/company_entity.dart';

Map<String, dynamic> tCompaniesResponse = {
  "data": [
    {"id": "1", "name": "Jaguar Unit"},
    {"id": "2", "name": "Tobias Unit"},
    {"id": "3", "name": "Apex Unit"}
  ]
};

List<CompanyEntity> tCompanyList = const [
  CompanyEntity(id: "1", name: "Jaguar Unit"),
  CompanyEntity(id: "2", name: "Tobias Unit"),
  CompanyEntity(id: "3", name: "Apex Unit"),
];

final tLocalFailure = LocalFailure();
