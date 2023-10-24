part of 'models.dart';
class Berita {
  String? beritaId;
  String? beritaGambar;
  String? beritaJudul;
  String? beritaIsi;
  String? beritaDibuatPada;
  String? message;
  bool? status;

  Berita(
      {this.beritaId,
        this.beritaGambar,
        this.beritaJudul,
        this.beritaIsi,
        this.beritaDibuatPada,
      this.message,
      this.status});

  Berita.fromJson(Map<String, dynamic> json) {
    beritaId = json['beritaId'];
    beritaGambar = json['beritaGambar'];
    beritaJudul = json['beritaJudul'];
    beritaIsi = json['beritaIsi'];
    beritaDibuatPada = json['beritaDibuatPada'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beritaId'] = this.beritaId;
    data['beritaGambar'] = this.beritaGambar;
    data['beritaJudul'] = this.beritaJudul;
    data['beritaIsi'] = this.beritaIsi;
    data['beritaDibuatPada'] = this.beritaDibuatPada;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
