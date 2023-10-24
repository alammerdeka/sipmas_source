part of 'screens.dart';
class DataSuratMasyarakatScreen extends StatefulWidget {


  @override
  State<DataSuratMasyarakatScreen> createState() => _DataSuratMasyarakatScreenState();
}

class _DataSuratMasyarakatScreenState extends State<DataSuratMasyarakatScreen> {
  getInit(String id) async {
    await Provider.of<BeritaProvider>(context, listen:false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen:false).getPegawais();
    await Provider.of<SuratProvider>(context, listen:false).getSuratsById(id);
    setState(() {

    });
  }
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    SuratProvider suratProvider = Provider.of<SuratProvider>(context);
    Widget untukSaya(){
      return Expanded(
        child: Container(
            margin: EdgeInsets.only(bottom: 60),
            width: double.infinity,
            child: (selectedIndex == 0)
                ? ListView(
              children:
              suratProvider.suratsById.map((surat) => MasyarakatSuratCard(surat)).toList(),
            )
                : ListView(
              children:suratProvider.suratsById.map((surat) => MasyarakatSuratFinalCard(surat)).toList(),
            )
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: ()=>getInit(userProvider.user.pengId!),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text('Surat'),
              SizedBox(height: 20),
              CustomTabbar(
                titles: ['Surat Proses', 'Surat Selesai'],
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
