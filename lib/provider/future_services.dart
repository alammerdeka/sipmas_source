part of 'providers.dart';

class FutureServices {
  Future<List<Berita>> getBerita() async {
    var responseBerita = await http.get(Uri.parse('${AppUrl.getBerita}'));
    print(responseBerita.body);
    if (responseBerita.statusCode == 200) {
      List data = jsonDecode(responseBerita.body);
      List<Berita> beritas = [];

      for (var item in data) {
        beritas.add(Berita.fromJson(item));
      }

      return beritas;
    } else {
      throw Exception('Gagal Get Berita');
    }
  }
  Future<List<User>> getPegawai() async {
    var responseBerita = await http.get(Uri.parse('${AppUrl.getPegawai}+5'));
    print(responseBerita.body);
    if (responseBerita.statusCode == 200) {
      List data = jsonDecode(responseBerita.body);
      List<User> pegawais = [];

      for (var item in data) {
        pegawais.add(User.fromJson(item));
      }

      return pegawais;
    } else {
      throw Exception('Gagal Get Berita');
    }
  }
  Future<List<Surat>> getSurat() async {
    var responseSurat = await http.get(Uri.parse('${AppUrl.getSurat}'));
    print(responseSurat.body);
    if (responseSurat.statusCode == 200) {
      List data = jsonDecode(responseSurat.body);
      List<Surat> surats = [];

      for (var item in data) {
        surats.add(Surat.fromJson(item));
      }

      return surats;
    } else {
      throw Exception('Gagal Get Surat');
    }
  }
  Future<List<User>> getMasyarakat() async {
    var responseMasyarakat = await http.get(Uri.parse('${AppUrl.getMasyarakat}'));
    print(responseMasyarakat.body);
    if (responseMasyarakat.statusCode == 200) {
      List data = jsonDecode(responseMasyarakat.body);
      List<User> masyarakat = [];

      for (var item in data) {
        masyarakat.add(User.fromJson(item));
      }

      return masyarakat;
    } else {
      throw Exception('Gagal Get Masyarakat');
    }
  }
  Future<List<Surat>> getSuratById(String id) async {
    var responseSurat = await http.get(Uri.parse('${AppUrl.getSuratById+id}'));
    print(responseSurat.body);
    if (responseSurat.statusCode == 200) {
      List data = jsonDecode(responseSurat.body);
      List<Surat> surats = [];

      for (var item in data) {
        surats.add(Surat.fromJson(item));
      }

      return surats;
    } else {
      throw Exception('Gagal Get Surat');
    }
  }

  Future<User>getUser(String idUser) async {
    var responseUser = await http.get(Uri.parse('${AppUrl.getUser+idUser}'));
    print(responseUser.body);
    if (responseUser.statusCode == 200) {
      User data = User.fromJson(jsonDecode(responseUser.body));
      print(data);
      return User.fromJson(jsonDecode(responseUser.body));
    } else {
      throw Exception('Gagal Get Berita');
    }
  }


}
