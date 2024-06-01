part of 'assets_cubit.dart';

sealed class AssetsState extends Equatable {
  const AssetsState();

  @override
  List<Object> get props => [];
}

final class AssetsInitial extends AssetsState {}

final class AssetsCarregando extends AssetsState {}

final class AssetsErro extends AssetsState {}

final class AssetsSemDados extends AssetsState {}

final class AssetsFiltroCarregando extends AssetsState {}

final class AssetsSucesso extends AssetsState {
  final List<ItemEntity> itens;
  const AssetsSucesso({required this.itens});

  @override
  List<Object> get props => [super.props, itens];
}
