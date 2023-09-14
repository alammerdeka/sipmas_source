part of 'pegawai_screens.dart';
class DataSuratPegawaiScreen extends StatefulWidget {


  @override
  State<DataSuratPegawaiScreen> createState() => _DataSuratPegawaiScreenState();
}

class _DataSuratPegawaiScreenState extends State<DataSuratPegawaiScreen> {
  getInit() async {
    await Provider.of<BeritaProvider>(context, listen:false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen:false).getPegawais();
    await Provider.of<SuratProvider>(context, listen:false).getSurats();
    setState(() {
    });
  }
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    SuratProvider suratProvider = Provider.of<SuratProvider>(context);
    Widget untukSaya(){
      return Expanded(
        child: Container(
            margin: EdgeInsets.only(bottom: 60),
            width: double.infinity,
            child: (selectedIndex == 0)
                ? ListView(
              children:
              suratProvider.surats.map((surat) => PegawaiSuratCard(surat)).toList(),
            )
                : ListView(
              children:suratProvider.surats.map((surat) => KadinSuratDoneCard(surat)).toList(),
            )
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: ()=>getInit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text('Surat'),
              SizedBox(height: 20),
              CustomTabbar(
                titles: ['Surat Masuk', 'Surat Selesai'],
                selectedIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              Builder(builder: (_) {
                return untukSaya();
              }),
            ],
          ),
        ),

      ),
    );
  }
}
