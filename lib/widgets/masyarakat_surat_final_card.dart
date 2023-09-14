part of 'widgets.dart';

class MasyarakatSuratFinalCard extends StatelessWidget {
  final Surat surat;
  MasyarakatSuratFinalCard(this.surat);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UpdateSuratScreen(surat)));
      },
      child:surat.suratStatus=='4'?Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(surat.suratJenis),
                  SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    child: Text(
                      surat.suratNama,
                      maxLines: 3,
                    ),
                  ),
                  surat.suratStatus=='1'?Text('Permohonan Surat Diterima',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),):surat.suratStatus=='2'?Text('Permohonan Surat Diproses',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),):surat.suratStatus=='3'?Text('Permohonan Surat Ditolak',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),):surat.suratStatus=='4'?Text('Surat Ditanda tangani Kepala Dinas',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),):SizedBox(),
                ],
              ),
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
            ):SizedBox()
          ,
    );
  }
}
