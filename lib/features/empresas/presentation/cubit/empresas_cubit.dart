import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tractian_challenge/features/empresas/domain/entities/empresa_entity.dart';
import 'package:tractian_challenge/features/empresas/domain/usecases/obter_empresas_usecase.dart';

part 'empresas_state.dart';

class EmpresasCubit extends Cubit<EmpresasState> {
  final ObterEmpresasUsecase _obterEmpresasUsecase;

  EmpresasCubit(ObterEmpresasUsecase obterEmpresasUsecase)
      : _obterEmpresasUsecase = obterEmpresasUsecase,
        super(EmpresasCarregando());

  Future<void> obterEmpresas() async {
    emit(EmpresasCarregando());
    final empresasResult = await _obterEmpresasUsecase();
    empresasResult.fold(
      (_) => emit(EmpresasErro()),
      (empresas) {
        if (empresas.isEmpty) {
          return emit(EmpresasSemDados());
        }
        emit(EmpresasSucesso(empresas: empresas));
      },
    );
  }
}
