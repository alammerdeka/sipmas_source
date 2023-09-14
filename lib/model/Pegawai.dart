part of 'models.dart';
class Berita {
  String beritaJudul;
  String beritaIsi;
  String beritaGambar;
  bool status;

  Berita({this.beritaJudul, this.beritaIsi, this.beritaGambar, this.status});

  Berita.fromJson(Map<String, dynamic> json) {
    beritaJudul = json['beritaJudul'];
    beritaIsi = json['beritaIsi'];
    beritaGambar = json['beritaGambar'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beritaJudul'] = this.beritaJudul;
    data['beritaIsi'] = this.beritaIsi;
    data['beritaGambar'] = this.beritaGambar;
    data['status'] = this.status;
    return data;
  }
}