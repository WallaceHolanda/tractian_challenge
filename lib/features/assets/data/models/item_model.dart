import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    required super.id,
    required super.name,
    required super.itens,
    super.parentId,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      name: map['name'],
      parentId: map['parentId'],
      itens: [],
    );
  }
}
