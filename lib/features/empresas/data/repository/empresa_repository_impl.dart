import 'package:dartz/dartz.dart';
import 'package:tractian_challenge/core/erro/failure.dart';
import 'package:tractian_challenge/features/empresas/data/datasource/i_empresa_datasource.dart';
import 'package:tractian_challenge/features/empresas/data/models/empresa_model.dart';
import 'package:tractian_challenge/features/empresas/domain/entities/empresa_entity.dart';
import 'package:tractian_challenge/features/empresas/domain/repository/i_empresa_repository.dart';

class EmpresaRepositoryImpl implements IEmpresaRepository {
  final IEmpresaDatasource _datasource;

  EmpresaRepositoryImpl(IEmpresaDatasource datasource)
      : _datasource = datasource;

  @override
  Future<Either<Failure, List<EmpresaEntity>>> obterEmpresas() async {
    try {
      final response = await _datasource.obterEmpresas();

      if (response['data'] != null && response['data'].isNotEmpty) {
        final dados = response['data'] as List;
        final empresas =
            dados.map((empresa) => EmpresaModel.fromMap(empresa)).toList();
        return Right(empresas);
      }
      return const Right([]);
    } on Failure catch (failure) {
      return Left(failure);
    } catch (_) {
      return Left(LocalFailure());
    }
  }
}
