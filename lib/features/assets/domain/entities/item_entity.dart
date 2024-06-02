class ItemEntity {
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
}
