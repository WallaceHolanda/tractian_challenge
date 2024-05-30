import 'package:tractian_challenge/features/assets/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({
    required super.id,
    required super.name,
    super.parentId,
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      name: map['name'],
      parentId: map['parentId'],
    );
  }
}
