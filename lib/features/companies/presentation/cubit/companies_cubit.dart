import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian_challenge/features/companies/domain/entities/company_entity.dart';
import 'package:tractian_challenge/features/companies/domain/usecases/obter_companies_usecase.dart';

part 'companies_state.dart';

class CompaniesCubit extends Cubit<CompaniesState> {
  final ObterCompaniesUsecase _obterCompaniesUsecase;

  CompaniesCubit(ObterCompaniesUsecase obterCompaniesUsecase)
      : _obterCompaniesUsecase = obterCompaniesUsecase,
        super(CompaniesCarregando());

  Future<void> obterCompanies() async {
    emit(CompaniesCarregando());
    final companiesResult = await _obterCompaniesUsecase();
    companiesResult.fold(
      (_) => emit(CompaniesErro()),
      (companies) {
        if (companies.isEmpty) {
          return emit(CompaniesSemDados());
        }
        emit(CompaniesSucesso(companies: companies));
      },
    );
  }
}
