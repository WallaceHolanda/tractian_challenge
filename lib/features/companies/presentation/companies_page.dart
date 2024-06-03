import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge/core/assets/images_enum.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_colors_enum.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_strings_enum.dart';
import 'package:tractian_challenge/features/companies/presentation/cubit/companies_cubit.dart';
import 'package:tractian_challenge/features/core/widgets/erro_widget.dart';
import 'package:tractian_challenge/features/companies/presentation/widgets/companies_carregando_widget.dart';
import 'package:tractian_challenge/features/companies/presentation/widgets/companies_widget.dart';
import 'package:tractian_challenge/features/core/widgets/sem_dados_widget.dart';

class CompaniesPage extends StatefulWidget {
  const CompaniesPage({super.key});

  @override
  State<CompaniesPage> createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  late final CompaniesCubit cubit;

  @override
  void initState() {
    cubit = context.read<CompaniesCubit>();
    cubit.obterCompanies();
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
      body: BlocBuilder<CompaniesCubit, CompaniesState>(
        builder: (context, state) {
          return switch (state) {
            CompaniesInitial() => const SizedBox(),
            CompaniesCarregando() => const CompaniesCarregandoWidget(),
            CompaniesErro() => ErroWidget(
                texto: AppStringsEnum.ocorreuUmErroAoListarAsEmpresas.texto,
              ),
            CompaniesSemDados() => SemDadosWidget(
                texto: AppStringsEnum.naoExistemEmpresasDisponiveis.texto,
              ),
            CompaniesSucesso() => CompaniesWidget(companies: state.companies),
          };
        },
      ),
    );
  }
}
