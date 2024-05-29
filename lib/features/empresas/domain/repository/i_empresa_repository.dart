import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/empresas/domain/entities/empresa_entity.dart';

abstract class IEmpresaRepository {
  Future<Either<Failure, List<EmpresaEntity>>> obterEmpresas();
}
