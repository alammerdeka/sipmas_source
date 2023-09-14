part of 'screens.dart';

class DetailBeritaScreen extends StatelessWidget {
  final Berita berita;
  DetailBeritaScreen(this.berita);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(berita.beritaGambar,width: MediaQuery.of(context).size.width,height: 200, fit: BoxFit.cover,)),
            SizedBox(height: 20,),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text('${berita.beritaJudul}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
            Text(berita.beritaIsi,style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
          ],
        ),
      )),
    );
  }
}
