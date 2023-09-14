part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getInit() async {
    await Provider.of<BeritaProvider>(context, listen: false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen: false).getPegawais();
    await Provider.of<SuratProvider>(context, listen: false).getSurats();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    BeritaProvider beritaProvider = Provider.of<BeritaProvider>(context);
    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'KELURAHAN SERANG',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(' JL.Empat Lima  SERANG, BANTEN')
          ],
        ),
      );
    }
    Widget berita() {
      return Column(
        children:
           beritaProvider.beritas.map((berita) => BeritaCard(berita)).toList(),
      );
    }

    return WillPopScope(
      onWillPop: ()=>exit(0),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: ()=>getInit(),
          child: ListView(
            children: [

              header(),
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
        ),
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: SizedBox(width:30)),
              Expanded(
                  flex: 1,
                  child: longButtons(10,'Masuk',(){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                  })),
            ],
          ),
        ),
      ),
    );
  }

}
