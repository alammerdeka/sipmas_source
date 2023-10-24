part of 'widgets.dart';
class KadinBeritaCard extends StatelessWidget {
  final Berita berita;
  KadinBeritaCard(this.berita);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UpdateBeritaScreen(berita)));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical:8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(berita.beritaGambar!,width: 100,height: 100,fit: BoxFit.cover,)),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width-150,child: Text(berita.beritaJudul!,style: TextStyle(fontWeight: FontWeight.w700),)),
                  SizedBox(height:8),
                  SizedBox(width: MediaQuery.of(context).size.width-150, child: Text(berita.beritaIsi!,maxLines: 3,),
                  ) ],),
            ),
        ],),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 2,
              )
            ]),

        ),
    );


  }
}
