part of 'widgets.dart';
class KadinSuratDoneCard extends StatelessWidget {
  final Surat surat;
  KadinSuratDoneCard(this.surat);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UpdateSuratScreen(surat)));
      },
      child: surat.suratStatus!='1'?Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical:8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/logopemkot.png',width: 100,height: 100,fit: BoxFit.cover,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(surat.suratJenis),
                SizedBox(height:8),
                SizedBox(width: MediaQuery.of(context).size.width-150, child: Text(surat.suratNama,maxLines: 3,),
                ) ],),
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

      ):SizedBox(),
    );


  }
}
