import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge/core/assets/images_enum.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_strings_enum.dart';
import 'package:tractian_challenge/features/empresas/presentation/cubit/empresas_cubit.dart';
import 'package:tractian_challenge/features/core/widgets/erro_widget.dart';
import 'package:tractian_challenge/features/empresas/presentation/widgets/empresas_carregando_widget.dart';
import 'package:tractian_challenge/features/empresas/presentation/widgets/empresas_widget.dart';
import 'package:tractian_challenge/features/core/widgets/sem_dados_widget.dart';

class EmpresasPage extends StatefulWidget {
  const EmpresasPage({super.key});

  @override
  State<EmpresasPage> createState() => _EmpresasPageState();
}

class _EmpresasPageState extends State<EmpresasPage> {
  late final EmpresasCubit cubit;

  @override
  void initState() {
    cubit = context.read<EmpresasCubit>();
    cubit.obterEmpresas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColorsEnum.darkBlue.cor,
        title: Image.asset(
          ImagesEnum.logo.caminho,
          height: 18,
          width: MediaQuery.sizeOf(context).width * 0.4,
        ),
      ),
      body: BlocBuilder<EmpresasCubit, EmpresasState>(
        builder: (context, state) {
          return switch (state) {
            EmpresasCarregando() => const EmpresasCarregandoWidget(),
            EmpresasErro() => ErroWidget(
                texto: AppStringsEnum.ocorreuUmErroAoListarAsEmpresas.texto,
              ),
            EmpresasSemDados() => SemDadosWidget(
                texto: AppStringsEnum.naoExistemEmpresasDisponiveis.texto,
              ),
            EmpresasSucesso() => EmpresasWidget(empresas: state.empresas),
          };
        },
      ),
    );
  }
}
