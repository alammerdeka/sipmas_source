part of 'kadin_screens.dart';
class DataPegawaiScreen extends StatefulWidget {
  const DataPegawaiScreen({Key key}) : super(key: key);

  @override
  State<DataPegawaiScreen> createState() => _DataPegawaiScreenState();
}

class _DataPegawaiScreenState extends State<DataPegawaiScreen> {
  @override
  void initState() {
    getInit();
    super.initState();
  }
  getInit()async{
     await Provider.of<PegawaiProvider>(context, listen:false).getPegawais();
     await Provider.of<UserProvider>(context, listen:false).getMasyarakat();
     setState(() {

     });

  }
  final formKey = GlobalKey<FormState>();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    PegawaiProvider pegawaiProvider = Provider.of<PegawaiProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    Widget untukSaya() {
      return Expanded(
        child: Container(
            margin: EdgeInsets.only(bottom: 60),
            width: double.infinity,
            child: (selectedIndex == 0)
                ? Form(
              key: formKey,
              child: ListView(children: pegawaiProvider.pegawais.map((pegawai) => KadinPegawaiCard(pegawai)).toList(),),
            )
                : ListView(children: userProvider.listUsers.map((masyarakat) => KadinMasyarakatCard(masyarakat)).toList(),),),
      );
    }


    return RefreshIndicator(
      onRefresh: ()=>getInit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text('Data Pegawai dan Masyarakat'),
              SizedBox(height: 20),
              CustomTabbar(
                titles: ['Pegawai', 'Masyarakat'],
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
        bottomNavigationBar: userProvider.user.grupNama!='Pegawai'?FloatingActionButton(
          child: Center(child:Icon(Icons.add)),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>TambahPegawaiScreen()));
          },
        ):SizedBox(),
      )
    );
  }
}
