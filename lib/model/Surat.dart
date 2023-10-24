part of 'models.dart';
class Surat {
  String? suratPengId;
  String? suratJenis;
  String? suratNama;
  String? suratNik;
  String? suratTempat;
  String? suratTanggal;
  String? suratAgama;
  String? suratStatusKawin;
  String? suratJenisKelamin;
  String? suratInstansi;
  String? suratAlamat;
  String? suratAlasan;
  String? suratPersyaratan;
  String? suratStatus;
  String? suratTujuan;
  String? suratAlasanPindah;
  String? suratPengikut;
  String? suratId;
  bool? status;
  String? message;

  Surat(
      {this.suratPengId,
        this.suratJenis,
        this.suratNama,
        this.suratNik,
        this.suratTempat,
        this.suratTanggal,
        this.suratAgama,
        this.suratStatusKawin,
        this.suratJenisKelamin,
        this.suratInstansi,
        this.suratAlamat,
        this.suratAlasan,
        this.suratPersyaratan,
        this.suratStatus,
        this.suratAlasanPindah,
        this.suratPengikut,
        this.suratTujuan,
        this.suratId,
        this.status,
      this.message});

  Surat.fromJson(Map<String, dynamic> json) {
    suratPengId = json['suratPengId'];
    suratJenis = json['suratJenis'];
    suratNama = json['suratNama'];
    suratNik = json['suratNik'];
    suratTempat = json['suratTempat'];
    suratTanggal = json['suratTanggal'];
    suratAgama = json['suratAgama'];
    suratStatusKawin = json['suratStatusKawin'];
    suratJenisKelamin = json['suratJenisKelamin'];
    suratInstansi = json['suratInstansi'];
    suratAlamat = json['suratAlamat'];
    suratAlasan = json['suratAlasan'];
    suratPersyaratan = json['suratPersyaratan'];
    suratStatus = json['suratStatus'];
    suratAlasanPindah = json['suratAlasanPindah'];
    suratPengikut = json['suratPengikut'];
    suratTujuan = json['suratTujuan'];
    suratId = json['suratId'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['suratPengId'] = this.suratPengId;
    data['suratJenis'] = this.suratJenis;
    data['suratNama'] = this.suratNama;
    data['suratNik'] = this.suratNik;
    data['suratTempat'] = this.suratTempat;
    data['suratTanggal'] = this.suratTanggal;
    data['suratAgama'] = this.suratAgama;
    data['suratStatusKawin'] = this.suratStatusKawin;
    data['suratJenisKelamin'] = this.suratJenisKelamin;
    data['suratInstansi'] = this.suratInstansi;
    data['suratAlamat'] = this.suratAlamat;
    data['suratAlasan'] = this.suratAlasan;
    data['suratPersyaratan'] = this.suratPersyaratan;
    data['suratStatus'] = this.suratStatus;
    data['suratId'] = this.suratId;
    data['suratAlasanPindah'] = this.suratAlasanPindah;
    data['suratPengikut'] = this.suratPengikut;
    data['suratTujuan'] = this.suratTujuan;
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
