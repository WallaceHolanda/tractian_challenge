abstract class IAssetsDatasource {
  Future<Map<String, dynamic>> obterAssets(String companyId);
  Future<Map<String, dynamic>> obterLocations(String companyId);
}
