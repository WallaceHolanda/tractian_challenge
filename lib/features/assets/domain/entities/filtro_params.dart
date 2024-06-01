class FiltroParams {
  final String nome;
  final bool isSensorEnergia;
  final bool isCritico;

  FiltroParams({
    required this.nome,
    this.isSensorEnergia = false,
    this.isCritico = false,
  });

  bool get isFiltroAtivo => nome.isNotEmpty || isSensorEnergia || isCritico;
}
