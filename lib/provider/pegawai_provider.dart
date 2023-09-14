part of 'providers.dart';

class PegawaiProvider with ChangeNotifier {
  List<User> _pegawais = [];
  List<User> get pegawais => _pegawais;

  set pegawais(List<User> pegawais) {
    _pegawais = pegawais;
    notifyListeners();
  }

  Future<void> getPegawais() async {
    try {
      List<User> pegawais = await FutureServices().getPegawai();
      _pegawais = pegawais;
    } catch (e) {
      print(e);
    }
  }


}