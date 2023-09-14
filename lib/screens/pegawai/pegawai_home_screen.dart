part of 'pegawai_screens.dart';
class PegawaiHomeScreen extends StatefulWidget {
  const PegawaiHomeScreen({Key key}) : super(key: key);

  @override
  State<PegawaiHomeScreen> createState() => _PegawaiHomeScreenState();
}

class _PegawaiHomeScreenState extends State<PegawaiHomeScreen> {
  getInit() async {
    await Provider.of<BeritaProvider>(context, listen:false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen:false).getPegawais();
    await Provider.of<SuratProvider>(context, listen:false).getSurats();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    BeritaProvider beritaProvider = Provider.of<BeritaProvider>(context);
    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hallo, ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    userProvider.user.pengNama,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    Widget fitur() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kelola'),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buttonFitur(Icon(Icons.person), 'Pengguna', () { Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataPegawaiScreen()));}),
                  buttonFitur(Icon(Icons.insert_drive_file), 'Surat', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DataSuratPegawaiScreen()));
                  }),
                  buttonFitur(
                      Icon(Icons.newspaper), 'Berita', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DataBeritaScreen()));
                  }),
                ],
              ),
            ),
          ],
        ),
      );
    }
    Widget berita() {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: beritaProvider.beritas
              .map((berita) => BeritaCard(berita))
              .toList(),
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: ()=>getInit(),
      child: Scaffold(
        body: ListView(children: [
          SizedBox(height: 20),
          header(),
          fitur(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Berita Terkini',
                    style: TextStyle(fontWeight: FontWeight.w700)),
                berita()
              ],
            ),
          ),
        ],),
      ),
    );
  }
  buttonFitur(Icon iconFitur, String title, Null Function() fun) {
    return InkWell(
      onTap: fun,
      child: Container(
        child: Column(
          children: [
            iconFitur,
            Text(title),
          ],
        ),
      ),
    );
  }
}
