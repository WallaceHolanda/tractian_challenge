import 'package:equatable/equatable.dart';

class EmpresaEntity extends Equatable {
  final String id;
  final String name;

  const EmpresaEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
