import 'package:flutter/material.dart';

class FiltroNotifier {
  ValueNotifier<bool> habilitado = ValueNotifier<bool>(false);

  void alteraValor() => habilitado.value = !habilitado.value;
}
