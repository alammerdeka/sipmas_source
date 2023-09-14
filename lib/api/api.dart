class AppUrl{
  static const String baseUrl = 'https://pemkot.digitaline.site/api/';
  static const String registrasi = baseUrl+'auth/register';
  static const String login = baseUrl+'auth/login';
  static const String getUser = baseUrl+'pengguna/detail?pengId=';
  static const String getSurat = baseUrl+'surat';
  static const String getSuratById = baseUrl+'surat?pengId=';
  static const String getBerita = baseUrl+'Berita';
  static const String getPegawai = baseUrl+'pengguna?grupId=';
  static const String postPegawai = baseUrl+'pengguna/create';
  static const String putPegawai = baseUrl+'pengguna/update';
  static const String deletePegawai = baseUrl+'pengguna/destroy';
  static const String postBerita = baseUrl+'berita/create';
  static const String putBerita = baseUrl+'berita/update';
  static const String deleteBerita = baseUrl+'berita/delete';
  static const String postSuratPindah = baseUrl+'';
  static const String postValidasiKadin = baseUrl+'surat/tanda_tangan?suratId=';
  static const String postKonfirmasiPegawai = baseUrl+'surat/konfirmasi';
  static const String postPindah = baseUrl+'surat/ajukan';
  static const String getMasyarakat = baseUrl+'pengguna?grupId=7';
  static const String pdfSlash = '/pdf';
  static const String downloadUrl = 'https://pemkot.digitaline.site/backoffice/';


}