import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge/core/assets/images_enum.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';
import 'package:tractian_challenge/features/empresas/presentation/cubit/empresas_cubit.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 48,
              width: double.maxFinite,
              color: Theme.of(context).colorScheme.azulEscuro,
              child: Image.asset(
                ImagesEnum.logo.caminho,
                height: 18,
                width: MediaQuery.sizeOf(context).width * 0.4,
              ),
            ),
            BlocBuilder<EmpresasCubit, EmpresasState>(
              builder: (context, state) {
                return switch (state) {
                  EmpresasCarregando() => const SizedBox(
                      child: Text('Carregando'),
                    ),
                  EmpresasErro() => const SizedBox(
                      child: Text('Erro'),
                    ),
                  EmpresasSemDados() => const SizedBox(
                      child: Text('Sem Dados'),
                    ),
                  EmpresasSucesso() => const SizedBox(
                      child: Text('Sucesso'),
                    ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
