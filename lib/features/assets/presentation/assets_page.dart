import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';
import 'package:tractian_challenge/features/assets/presentation/cubit/assets_cubit.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/assets_carregando_widget.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/filtro/filtro_opcoes_widget.dart';
import 'package:tractian_challenge/features/core/utils/app_strings_enum.dart';
import 'package:tractian_challenge/features/core/widgets/erro_widget.dart';
import 'package:tractian_challenge/features/core/widgets/sem_dados_widget.dart';

class AssetsPage extends StatefulWidget {
  final String companyId;

  const AssetsPage({
    super.key,
    required this.companyId,
  });

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  late final AssetsCubit cubit;

  @override
  void initState() {
    cubit = context.read<AssetsCubit>();
    cubit.obterItens(widget.companyId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.azulEscuro,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(
            Icons.chevron_left,
            color: Theme.of(context).colorScheme.white,
            size: 32,
          ),
        ),
        title: Text(
          AppStringsEnum.assets.texto,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.white,
          ),
        ),
      ),
      body: BlocBuilder<AssetsCubit, AssetsState>(
        builder: (context, state) {
          return switch (state) {
            AssetsInitial() => const SizedBox(),
            AssetsCarregando() => const AssetsCarregandoWidget(),
            AssetsErro() => ErroWidget(
                texto: AppStringsEnum.ocorreuUmErroAoListarOsAssets.texto,
              ),
            AssetsSemDados() => SemDadosWidget(
                texto: AppStringsEnum.naoExistemEmpresasDisponiveis.texto,
              ),
            AssetsSucesso() => Column(
                children: [
                  const FiltroOpcoesWidget(),
                  Divider(
                    thickness: 0.5,
                    color: Theme.of(context).colorScheme.gray,
                  ),
                ],
              ),
          };
        },
      ),
    );
  }
}
