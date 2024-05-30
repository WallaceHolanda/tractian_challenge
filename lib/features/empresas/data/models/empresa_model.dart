import 'package:tractian_challenge/features/empresas/domain/entities/empresa_entity.dart';

class EmpresaModel extends EmpresaEntity {
  const EmpresaModel({
    required super.id,
    required super.name,
  });

  factory EmpresaModel.fromMap(Map<String, dynamic> map) {
    return EmpresaModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
