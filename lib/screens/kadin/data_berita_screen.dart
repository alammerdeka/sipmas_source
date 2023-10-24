part of 'kadin_screens.dart';
class DataBeritaScreen extends StatefulWidget {
  const DataBeritaScreen({super.key});

  @override
  State<DataBeritaScreen> createState() => _DataBeritaScreenState();
}

class _DataBeritaScreenState extends State<DataBeritaScreen> {
  @override
  void initState() {
    getInit();
    super.initState();
  }
  getInit() async {
    await Provider.of<BeritaProvider>(context, listen:false).getBeritas();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    BeritaProvider beritaProvider = Provider.of<BeritaProvider>(context);
    Widget berita() {
      return Column(
        children:
        beritaProvider.beritas.map((berita) => KadinBeritaCard(berita)).toList(),
      );
    }
    return RefreshIndicator(
      onRefresh: ()=>getInit(),
      child: Scaffold(
        body: ListView(
          children: [
            berita(),
          ],
        ),
        bottomNavigationBar: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>TambahBeritaScreen()));
          },
          child: Center(child: Icon(Icons.add),),),
      ),
    );
  }
}
