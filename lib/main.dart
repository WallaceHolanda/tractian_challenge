import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:tractian_challenge/core/dependencia/app_dependencia.dart';
import 'package:tractian_challenge/features/assets/presentation/assets_page.dart';
import 'package:tractian_challenge/features/assets/presentation/cubit/assets_cubit.dart';
import 'package:tractian_challenge/features/core/utils/app_routes_enum.dart';
import 'package:tractian_challenge/features/empresas/presentation/cubit/empresas_cubit.dart';
import 'package:tractian_challenge/features/empresas/presentation/empresas_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(23, 25, 45, 1),
  ));

  await AppDependencia().inicializar();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tractian Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        AppRoutesEnum.empresas.rota: (context) => BlocProvider(
              create: (context) => GetIt.instance<EmpresasCubit>(),
              child: const EmpresasPage(),
            ),
        AppRoutesEnum.assets.rota: (context) => BlocProvider(
              create: (context) => GetIt.instance<AssetsCubit>(),
              child: AssetsPage(
                companyId: ModalRoute.of(context)?.settings.arguments as String,
              ),
            ),
      },
    );
  }
}
