part of 'providers.dart';


enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }



  Future<User> registrasiUser(String pengNama,
      String pengNik,
      String pengTempat,
      String pengTanggal,
      String pengJenisKelamin,
      String pengAgama,
      String pengStatusKawin,
      String pengAlamat,
      String pengTlp,
      String pengInstansi,
      String pengEmail,
      String pengPass,
     ) async {
    try {
      var body = ({
        'pengNama':pengNama,
        'pengNik': pengNik,
        'pengTempat': pengTempat,
        'pengTanggal':pengTanggal,
        'pengJenisKelamin': pengJenisKelamin,
        'pengAgama': pengAgama,
        'pengStatusKawin':pengStatusKawin,
        'pengAlamat':pengAlamat,
        'pengTlp': pengTlp,
        'pengInstansi': pengInstansi,
        'pengEmail': pengEmail,
        'pengPass': pengPass,
      });

      var response = await http.post(Uri.parse(AppUrl.registrasi),
          body: body);

      print(response.statusCode);
      print('KAKAKKAK${response.body}');

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        // var data = json.decode(response.body);
        // return Pregist.fromJson(data);
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> registPegawai(String pengNama,
      String pengNik,
      String pengTempat,
      String pengTanggal,
      String pengJenisKelamin,
      String pengAgama,
      String pengStatusKawin,
      String pengAlamat,
      String pengTlp,
      String pengInstansi,
      String pengEmail,
      String pengPass,
      String password_confirm,
      String grupId,
      String pengAktif,
      ) async {
    try {
      var body = ({
        'pengNama':pengNama,
        'pengNik': pengNik,
        'pengTempat': pengTempat,
        'pengTanggal':pengTanggal,
        'pengJenisKelamin': pengJenisKelamin,
        'pengAgama': pengAgama,
        'pengStatusKawin':pengStatusKawin,
        'pengAlamat':pengAlamat,
        'pengTlp': pengTlp,
        'pengInstansi': pengInstansi,
        'pengEmail': pengEmail,
        'pengPass': pengPass,
        'password_confirm':password_confirm,
        'grupId':grupId,
        'pengAktif':pengAktif,
      });

      var response = await http.post(Uri.parse(AppUrl.postPegawai),
          body: body);

      print(response.statusCode);
      print('KAKAKKAK${response.body}');

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        // var data = json.decode(response.body);
        // return Pregist.fromJson(data);
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
  Future<User> editPegawai(
      String pengId,
      String pengNama,
      String pengNik,
      String pengTempat,
      String pengTanggal,
      String pengJenisKelamin,
      String pengAgama,
      String pengStatusKawin,
      String pengAlamat,
      String pengTlp,
      String pengInstansi,
      String pengEmail,
      String pengPass,
      String password_confirm,
      String grupId,
      String pengAktif,
      ) async {
    try {
      var body = ({
        'pengId':pengId,
        'pengNama':pengNama,
        'pengNik': pengNik,
        'pengTempat': pengTempat,
        'pengTanggal':pengTanggal,
        'pengJenisKelamin': pengJenisKelamin,
        'pengAgama': pengAgama,
        'pengStatusKawin':pengStatusKawin,
        'pengAlamat':pengAlamat,
        'pengTlp': pengTlp,
        'pengInstansi': pengInstansi,
        'pengEmail': pengEmail,
        'pengPass': pengPass,
        'password_confirm':password_confirm,
        'grupId':grupId,
        'pengAktif':pengAktif,
      });

      var response = await http.post(Uri.parse(AppUrl.putPegawai),
          body: body);

      print(response.statusCode);
      print('KAKAKKAK${response.body}');

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        // var data = json.decode(response.body);
        // return Pregist.fromJson(data);
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> userLogin(String identity, String password) async {
    try {
      var body = ({
        'identity': identity,
        'password': password,
      });
      var response = await http.post(Uri.parse(AppUrl.login),
           body: body);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        User data = User.fromJson(jsonDecode(response.body));
        print(data);
        return User.fromJson(jsonDecode(response.body));
      } else {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> deleteUser(String pengId) async {
    try {
      var body = ({
        'pengId': pengId,
      });
      var response = await http.post(Uri.parse(AppUrl.deletePegawai),
          body: body);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        User data = User.fromJson(jsonDecode(response.body));
        print(data);
        return User.fromJson(jsonDecode(response.body));
      } else {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

}
