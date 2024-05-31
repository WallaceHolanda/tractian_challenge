import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge/core/assets/images_enum.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';
import 'package:tractian_challenge/features/empresas/presentation/cubit/empresas_cubit.dart';
import 'package:tractian_challenge/features/empresas/presentation/widgets/empresas_erro_widget.dart';
import 'package:tractian_challenge/features/empresas/presentation/widgets/empresas_loading_widget.dart';
import 'package:tractian_challenge/features/empresas/presentation/widgets/empresas_widget.dart';
import 'package:tractian_challenge/features/empresas/presentation/widgets/sem_dados_widget.dart';

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
        backgroundColor: Theme.of(context).colorScheme.azulEscuro,
        title: Image.asset(
          ImagesEnum.logo.caminho,
          height: 18,
          width: MediaQuery.sizeOf(context).width * 0.4,
        ),
      ),
      body: BlocBuilder<EmpresasCubit, EmpresasState>(
        builder: (context, state) {
          return switch (state) {
            EmpresasCarregando() => const EmpresasLoadingWidget(),
            EmpresasErro() => const EmpresasErroWidget(),
            EmpresasSemDados() => const SemDadosWidget(),
            EmpresasSucesso() => EmpresasWidget(empresas: state.empresas),
          };
        },
      ),
    );
  }
}
