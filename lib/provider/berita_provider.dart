part of 'providers.dart';
class BeritaProvider with ChangeNotifier {
  List<Berita> _beritas = [];
  List<Berita> get beritas => _beritas;
  List<Berita> _beritasPopuler = [];
  List<Berita> get beritasPopuler => _beritasPopuler;

  set beritas(List<Berita> beritas) {
    _beritas = beritas;
    notifyListeners();
  }

  set beritasPopuler(List<Berita> beritasPopuler){
    _beritasPopuler = beritasPopuler;
    notifyListeners();
  }

  Future<void>getBeritasPupuler() async {
    try{
      List<Berita> beritasPopuler = await FutureServices().getBerita();
      _beritasPopuler = _beritasPopuler;
    }catch(e){
      print(e);
    }
  }

  Future<void> getBeritas() async {
    try {
      List<Berita> beritas = await FutureServices().getBerita();
      _beritas = beritas;
    } catch (e) {
      print(e);
    }
  }
  Future<Berita?> deleteBerita(String beritaId) async {
    try {
      var body = ({
        'beritaId': beritaId,
      });

      var response =
      await http.post(Uri.parse(AppUrl.deleteBerita), body: body);
      print(response.statusCode);
      print('${response.body}');
      if (response.statusCode == 200) {
        return Berita.fromJson(jsonDecode(response.body));
      } else {
        // var data = json.decode(response.body);
        // return Pregist.fromJson(data);
        return Berita.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
  }

}
