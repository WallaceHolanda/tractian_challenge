import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String id;
  final String name;
  final String? parentId;
  final List<ItemEntity> itens;

  const ItemEntity({
    required this.id,
    required this.name,
    required this.itens,
    this.parentId,
  });

  @override
  List<Object?> get props => [id, name, itens];
}
