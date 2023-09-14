part of 'screens.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({Key key}) : super(key: key);

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  getInit(String id) async {
    await Provider.of<BeritaProvider>(context, listen: false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen: false).getPegawais();
    await Provider.of<SuratProvider>(context, listen: false).getSuratsById(id);
    setState(() {});
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
            Text('Buat Surat Keterangan'),
            SizedBox(
              height: 10,
            ),
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
                  buttonFitur(Icon(Icons.move_down), 'Pindah', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuratPindahScreen()));
                  }),
                  buttonFitur(Icon(Icons.airline_seat_flat), 'Kematian', () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuratKematianScreen()));
                  }),
                  buttonFitur(
                      Icon(Icons.accessibility_new_rounded), 'Belum Menikah',
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuratNikahScreen()));
                  }),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget data() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Surat Keterangan'),
                Text('Lihat Semua'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 30),
                Container(
                  height: 200,
                  width: 250,
                  color: Colors.red,
                ),
                Container(
                  height: 200,
                  width: 250,
                  color: Colors.blue,
                ),
                Container(
                  height: 200,
                  width: 250,
                  color: Colors.green,
                ),
                Container(
                  height: 200,
                  width: 250,
                  color: Colors.orange,
                ),
              ],
            ),
          )
        ],
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
      onRefresh: () => getInit(userProvider.user.pengId),
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          header(),
          SizedBox(
            height: 30,
          ),
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
        ],
      ),
    );
  }

  Widget buttonFitur(Icon iconFitur, String title, Function fun) {
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
