import 'package:flutter/material.dart';
import 'package:tractian_challenge/features/core/utils/enums/app_routes_enum.dart';
import 'package:tractian_challenge/features/companies/domain/entities/company_entity.dart';
import 'package:tractian_challenge/features/companies/presentation/widgets/company_card.dart';

class CompaniesWidget extends StatelessWidget {
  final List<CompanyEntity> companies;

  const CompaniesWidget({
    super.key,
    required this.companies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: companies.length,
      padding: const EdgeInsets.only(
        top: 30,
        left: 22,
        right: 22,
      ),
      itemBuilder: (context, index) => Column(
        children: [
          CompanyCard(
            nome: companies[index].name,
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutesEnum.assets.rota,
              arguments: companies[index].id,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
