part of 'models.dart';
class User {
  String identity;
  String pengId;
  String pengNama;
  String pengEmail;
  String pengPass;
  String pengNik;
  String pengTlp;
  String pengFoto;
  String pengJenisKelamin;
  String pengAgama;
  String pengStatusKawin;
  String pengInstansi;
  String pengAlamat;
  String pengTempat;
  String pengTanggal;
  String pengDibuatPada;
  String grupNama;
  String password_confirm;
  String grupId;
  String pengAktif;
  String message;
  bool status;

  User(
      {this.identity,
        this.pengId,
        this.pengNama,
        this.pengEmail,
        this.pengPass,
        this.pengNik,
        this.pengTlp,
        this.pengFoto,
        this.pengJenisKelamin,
        this.pengAgama,
        this.pengStatusKawin,
        this.pengInstansi,
        this.pengAlamat,
        this.pengTempat,
        this.pengTanggal,
        this.pengDibuatPada,
        this.grupNama,
        this.password_confirm,
        this.grupId,
        this.pengAktif,
        this.message,
        this.status});

  User.fromJson(Map<String, dynamic> json) {
    identity = json['identity'];
    pengId = json['pengId'];
    pengNama = json['pengNama'];
    pengEmail = json['pengEmail'];
    pengPass = json['pengPass'];
    pengNik = json['pengNik'];
    pengTlp = json['pengTlp'];
    pengFoto = json['pengFoto'];
    pengJenisKelamin = json['pengJenisKelamin'];
    pengAgama = json['pengAgama'];
    pengStatusKawin = json['pengStatusKawin'];
    pengInstansi = json['pengInstansi'];
    pengAlamat = json['pengAlamat'];
    pengTempat = json['pengTempat'];
    pengTanggal = json['pengTanggal'];
    pengDibuatPada = json['pengDibuatPada'];
    grupNama = json['grupNama'];
    password_confirm = json['password_confirm'];
    grupId = json['grupId'];
    pengAktif = json['pengAktif'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identity'] = this.identity;
    data['pengId'] = this.pengId;
    data['pengNama'] = this.pengNama;
    data['pengEmail'] = this.pengEmail;
    data['pengPass'] = this.pengPass;
    data['pengNik'] = this.pengNik;
    data['pengTlp'] = this.pengTlp;
    data['pengFoto'] = this.pengFoto;
    data['pengJenisKelamin'] = this.pengJenisKelamin;
    data['pengAgama'] = this.pengAgama;
    data['pengStatusKawin'] = this.pengStatusKawin;
    data['pengInstansi'] = this.pengInstansi;
    data['pengAlamat'] = this.pengAlamat;
    data['pengTempat'] = this.pengTempat;
    data['pengTanggal'] = this.pengTanggal;
    data['pengDibuatPada'] = this.pengDibuatPada;
    data['grupNama'] = this.grupNama;
    data['password_confirm'] = this.password_confirm;
    data['grupId'] = this.grupId;
    data['pengAktif'] = this.pengAktif;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}