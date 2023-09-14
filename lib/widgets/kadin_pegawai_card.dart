part of 'widgets.dart';
class KadinPegawaiCard extends StatelessWidget {
  final User pegawai;
  KadinPegawaiCard(this.pegawai);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UpdatePegawaiScreen(pegawai)));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical:8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(pegawai.pengJenisKelamin=='Wanita'?'assets/woman.png':'assets/man.png',width: 100,height: 100,fit: BoxFit.cover,)),
           Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           SizedBox(
           width: MediaQuery.of(context).size.width-150,
        child:
        Text(pegawai.pengNama)),
    SizedBox(height:8),
    SizedBox(width: MediaQuery.of(context).size.width-150,
    child: Text(pegawai.grupNama,maxLines: 3,),

    ),
    SizedBox(
    width: MediaQuery.of(context).size.width-150,
    child:
    Text(pegawai.pengEmail)),
    SizedBox(
    width: MediaQuery.of(context).size.width-150,
    child:
    Text(pegawai.pengTlp)),
            ],),
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
