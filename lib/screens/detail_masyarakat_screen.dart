part of 'screens.dart';

class DetailMasyarakatScreen extends StatefulWidget {
  final User masyarakat;
  DetailMasyarakatScreen(this.masyarakat);

  @override
  State<DetailMasyarakatScreen> createState() => _DetailMasyarakatScreenState();
}

class _DetailMasyarakatScreenState extends State<DetailMasyarakatScreen> {
  Future<void> launchWhatsApp(String nomer) async {
    final link = await WhatsAppUnilink(
      phoneNumber: nomer,
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch('$link');
  }
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.masyarakat.pengNama,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(widget.masyarakat.pengEmail),
          SizedBox(height: 20,),
          Text('NIK : ${widget.masyarakat.pengNik}'),
          Text('Tempat & Tanggal Lahir : ${widget.masyarakat.pengTempat}, ${widget.masyarakat.pengTanggal}'),
          Text('Jenis Kelamin : ${widget.masyarakat.pengJenisKelamin}'),
          Text('Status : ${widget.masyarakat.pengStatusKawin}'),
          Text('Jenis Kelamin : ${widget.masyarakat.pengJenisKelamin}'),
          Text('Status Bekerja : ${widget.masyarakat.pengInstansi}'),
          Text('Alamat : ${widget.masyarakat.pengAlamat}'),
        ],
      );
    }

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            header(),
          ],
        ),
      ),
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(8.0),
      child: longButtons(100, 'Hubungi', (){
        launchWhatsApp('${widget.masyarakat.pengTlp}');
      }),
    ),
    );
  }
}
