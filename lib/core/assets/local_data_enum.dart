enum LocalDataEnum {
  companies('assets/api/companies.json'),
  assets('assets/api/assets.json'),
  locations('assets/api/locations.json');

  final String caminho;
  const LocalDataEnum(this.caminho);
}
