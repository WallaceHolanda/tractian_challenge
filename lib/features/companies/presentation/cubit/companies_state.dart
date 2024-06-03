part of 'companies_cubit.dart';

sealed class CompaniesState extends Equatable {
  const CompaniesState();

  @override
  List<Object> get props => [];
}

final class CompaniesCarregando extends CompaniesState {}

final class CompaniesErro extends CompaniesState {}

final class CompaniesSemDados extends CompaniesState {}

final class CompaniesSucesso extends CompaniesState {
  final List<CompanyEntity> companies;

  const CompaniesSucesso({required this.companies});
}
