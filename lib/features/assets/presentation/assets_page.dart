import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge/features/assets/presentation/cubit/assets_cubit.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/assets_page_carregando_widget.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/assets_widget.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/filtro/filtro_opcoes_widget.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_strings_enum.dart';
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
        backgroundColor: AppColorsEnum.darkBlue.cor,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(
            Icons.chevron_left,
            color: AppColorsEnum.white.cor,
            size: 32,
          ),
        ),
        title: Text(
          AppStringsEnum.assets.texto,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColorsEnum.white.cor,
          ),
        ),
      ),
      body: BlocBuilder<AssetsCubit, AssetsState>(
        builder: (context, state) {
          if (state is AssetsInitial) {
            return const SizedBox();
          }

          if (state is AssetsCarregando) {
            return const AssetsPageCarregandoWidget();
          }

          if (state is AssetsErro) {
            return ErroWidget(
              texto: AppStringsEnum.ocorreuUmErroAoListarOsAssets.texto,
            );
          }

          if (state is AssetsSemDados) {
            return SemDadosWidget(
              texto: AppStringsEnum.semResultados.texto,
            );
          }

          return Column(
            children: [
              FiltroOpcoesWidget(
                filtrar: cubit.filtrarItens,
              ),
              Divider(
                thickness: 0.5,
                color: AppColorsEnum.gray.cor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                  ),
                  child: AssetsWidget(
                    isCarregando: state is AssetsFiltroCarregando,
                    itens: state is AssetsSucesso ? state.itens : [],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
