part of 'assets_cubit.dart';

sealed class AssetsState extends Equatable {
  const AssetsState();

  @override
  List<Object> get props => [];
}

final class AssetsInitial extends AssetsState {}

final class AssetsCarregando extends AssetsState {}

final class AssetsErro extends AssetsState {}

final class AssetsSucesso extends AssetsState {}
