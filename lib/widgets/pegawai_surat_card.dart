part of 'widgets.dart';

class PegawaiSuratCard extends StatelessWidget {
  final Surat surat;
  PegawaiSuratCard(this.surat);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UpdateSuratScreen(surat)));
      },
      child: surat.suratStatus == '1'
          ? Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(surat.suratJenis!),
                  SizedBox(height: 8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    child: Text(
                      surat.suratNama!,
                      maxLines: 3,
                    ),
                  ),
                  Text('Perlu Divalidasi',style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),),
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
            )
          : SizedBox(),
    );
  }
}
