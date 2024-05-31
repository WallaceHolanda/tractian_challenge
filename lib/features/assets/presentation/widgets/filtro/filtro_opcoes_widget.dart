import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/assets/icons_enum.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/asset_text_form_field.dart';
import 'package:tractian_challenge/features/assets/presentation/widgets/filtro/filtro_notifier.dart';
import 'package:tractian_challenge/features/core/utils/app_strings_enum.dart';
import 'package:tractian_challenge/features/core/widgets/filtro_widget.dart';

class FiltroOpcoesWidget extends StatefulWidget {
  const FiltroOpcoesWidget({super.key});

  @override
  State<FiltroOpcoesWidget> createState() => _FiltroOpcoesWidgetState();
}

class _FiltroOpcoesWidgetState extends State<FiltroOpcoesWidget> {
  final focusNode = FocusNode();
  final textController = TextEditingController();
  final sensorFiltro = FiltroNotifier();
  final criticoFiltro = FiltroNotifier();

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          AssetTextFormField(
            maxLength: 40,
            focusNode: focusNode,
            controller: textController,
            onTapOutside: (_) => focusNode.unfocus(),
            hintText: AppStringsEnum.buscarAtivoOuLocal.texto,
            prefixIcon: Icon(
              Icons.search,
              size: 14,
              color: Theme.of(context).colorScheme.gray,
            ),
            onChanged: (texto) {},
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: sensorFiltro.habilitado,
                builder: (context, sensorHabilitado, _) => FiltroWidget(
                  isSelecionado: sensorHabilitado,
                  icone: IconsEnum.bolt,
                  width: MediaQuery.sizeOf(context).width * 0.48,
                  titulo: AppStringsEnum.sensorDeEnergia.texto,
                  onPressed: () {
                    sensorFiltro.alteraValor();
                  },
                ),
              ),
              const SizedBox(width: 8),
              ValueListenableBuilder<bool>(
                valueListenable: criticoFiltro.habilitado,
                builder: (context, criticoHabilitado, _) => FiltroWidget(
                  isSelecionado: criticoHabilitado,
                  icone: IconsEnum.exclamationCircle,
                  titulo: AppStringsEnum.critico.texto,
                  width: MediaQuery.sizeOf(context).width * 0.28,
                  onPressed: () {
                    criticoFiltro.alteraValor();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
