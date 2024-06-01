import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/color_scheme_extension.dart';
import 'package:tractian_challenge/features/core/widgets/shimmer_widget.dart';

class EmpresasCarregandoWidget extends StatelessWidget {
  const EmpresasCarregandoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      padding: const EdgeInsets.only(
        top: 30,
        left: 22,
        right: 22,
      ),
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            height: 76,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.azulClaro,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const SizedBox(width: 32),
                    const ShimmerWidget(
                      height: 24,
                      width: 24,
                      borderRadius: 5,
                    ),
                    const SizedBox(width: 16),
                    ShimmerWidget(
                      height: 24,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      borderRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
