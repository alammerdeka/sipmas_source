part of 'providers.dart';

class SuratProvider with ChangeNotifier {
  List<Surat> _surats = [];
  List<Surat> get surats => _surats;
  List<Surat> _suratsById = [];
  List<Surat> get suratsById => _suratsById;
  set suratsById(List<Surat> suratsById) {
    _suratsById = suratsById;
    notifyListeners();
  }

  set surats(List<Surat> surats) {
    _surats = surats;
    notifyListeners();
  }

  Future<void> getSurats() async {
    try {
      List<Surat> surats = await FutureServices().getSurat();
      _surats = surats;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSuratsById(String id) async {
    try {
      List<Surat> suratsById = await FutureServices().getSuratById(id);
      _suratsById = suratsById;
    } catch (e) {
      print(e);
    }
  }

  Future<Surat> postValidasiKadin(String suratId, String suratStatus) async {
    try {
      var body = ({'suratId': suratId, 'suratStatus': suratStatus});

      var response = await http
          .post(Uri.parse(AppUrl.postValidasiKadin + suratId), body: body);
      print(response.statusCode);
      print('${response.body}');
      if (response.statusCode == 200) {
        return Surat.fromJson(jsonDecode(response.body));
      } else {
        // var data = json.decode(response.body);
        // return Pregist.fromJson(data);
        return Surat.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Surat> postValidasiPegawai(String suratId, String suratStatus) async {
    try {
      var body = ({'suratId': suratId, 'suratStatus': suratStatus});

      var response =
          await http.post(Uri.parse(AppUrl.postKonfirmasiPegawai), body: body);
      print(response.statusCode);
      print('${response.body}');
      if (response.statusCode == 200) {
        return Surat.fromJson(jsonDecode(response.body));
      } else {
        // var data = json.decode(response.body);
        // return Pregist.fromJson(data);
        return Surat.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<Surat> postPindah(
    String suratPengId,
    String suratJenis,
    String suratNama,
    String suratNik,
    String suratTempat,
    String suratTanggal,
    String suratAgama,
    String suratStatusKawin,
    String suratJenisKelamin,
    String suratInstansi,
    String suratAlamat,
    String suratTujuan,
    String suratAlasanPindah,
    String suratPengikut,
  ) async {
    try {
      var body = ({
        'suratPengId': suratPengId,
        'suratJenis': suratJenis,
        'suratNama': suratNama,
        'suratNik': suratNik,
        'suratTempat': suratTempat,
        'suratTanggal': suratTanggal,
        'suratAgama': suratAgama,
        'suratStatusKawin': suratStatusKawin,
        'suratJenisKelamin': suratJenisKelamin,
        'suratInstansi': suratInstansi,
        'suratAlamat': suratAlamat,
        'suratTujuan':suratTujuan,
        'suratAlasanPindah':suratAlasanPindah,
        'suratPengikut':suratPengikut
      });

      var response = await http.post(Uri.parse(AppUrl.postPindah), body: body);
      print(response.statusCode);
      print('${response.body}');
      if (response.statusCode == 200) {
        return Surat.fromJson(jsonDecode(response.body));
      } else {
        return Surat.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }
  Future<Surat> postKematian(
      String suratPengId,
      String suratJenis,
      String suratNama,
      String suratNik,
      String suratTempat,
      String suratTanggal,
      String suratAgama,
      String suratStatusKawin,
      String suratJenisKelamin,
      String suratInstansi,
      String suratAlamat,
      ) async {
    try {
      var body = ({
        'suratPengId': suratPengId,
        'suratJenis': suratJenis,
        'suratNama': suratNama,
        'suratNik': suratNik,
        'suratTempat': suratTempat,
        'suratTanggal': suratTanggal,
        'suratAgama': suratAgama,
        'suratStatusKawin': suratStatusKawin,
        'suratJenisKelamin': suratJenisKelamin,
        'suratInstansi': suratInstansi,
        'suratAlamat': suratAlamat,
      });

      var response = await http.post(Uri.parse(AppUrl.postPindah), body: body);
      print(response.statusCode);
      print('${response.body}');
      if (response.statusCode == 200) {
        return Surat.fromJson(jsonDecode(response.body));
      } else {
        return Surat.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }
  Future<Surat> postBelumNikah(
      String suratPengId,
      String suratJenis,
      String suratNama,
      String suratNik,
      String suratTempat,
      String suratTanggal,
      String suratAgama,
      String suratStatusKawin,
      String suratJenisKelamin,
      String suratInstansi,
      String suratAlamat,
      String suratAlasan,
      String suratPersyaratan,

      ) async {
    try {
      var body = ({
        'suratPengId': suratPengId,
        'suratJenis': suratJenis,
        'suratNama': suratNama,
        'suratNik': suratNik,
        'suratTempat': suratTempat,
        'suratTanggal': suratTanggal,
        'suratAgama': suratAgama,
        'suratStatusKawin': suratStatusKawin,
        'suratJenisKelamin': suratJenisKelamin,
        'suratInstansi': suratInstansi,
        'suratAlamat': suratAlamat,
        'suratAlasan':suratAlasan,
        'suratPersyaratan':suratPersyaratan,

      });

      var response = await http.post(Uri.parse(AppUrl.postPindah), body: body);
      print(response.statusCode);
      print('${response.body}');
      if (response.statusCode == 200) {
        return Surat.fromJson(jsonDecode(response.body));
      } else {
        return Surat.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }
}
