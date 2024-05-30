part of 'empresas_cubit.dart';

sealed class EmpresasState extends Equatable {
  const EmpresasState();

  @override
  List<Object> get props => [];
}

final class EmpresasCarregando extends EmpresasState {}

final class EmpresasErro extends EmpresasState {}

final class EmpresasSemDados extends EmpresasState {}

final class EmpresasSucesso extends EmpresasState {
  final List<EmpresaEntity> empresas;

  const EmpresasSucesso({required this.empresas});
}
