import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/empresas/domain/entities/empresa_entity.dart';
import 'package:tractian_challenge/features/empresas/domain/repository/i_empresa_repository.dart';

class ObterEmpresasUsecase {
  final IEmpresaRepository _repository;

  ObterEmpresasUsecase(IEmpresaRepository repository)
      : _repository = repository;

  Future<Either<Failure, List<EmpresaEntity>>> call() async {
    return _repository.obterEmpresas();
  }
}
