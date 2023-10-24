part of 'screens.dart';


class ValidasiScreen extends StatefulWidget {
  const ValidasiScreen({super.key});

  @override
  State<ValidasiScreen> createState() => _ValidasiScreenState();
}

class _ValidasiScreenState extends State<ValidasiScreen> {
  @override
  void initState() {
    getContent();
    getInit();
    super.initState();
  }
  getContent() async {
    UserProvider userProvider = Provider.of<UserProvider>(context,listen: false);
    await Provider.of<BeritaProvider>(context, listen:false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen:false).getPegawais();
    await Provider.of<SuratProvider>(context, listen:false).getSurats();
    await Provider.of<SuratProvider>(context, listen:false).getSuratsById(userProvider.user.pengId!);
  }
  getInit() async {
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    if(userProvider.user.grupNama=='Masyarakat'){
      Timer(Duration(seconds: 5), (){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
      });
    }else if(userProvider.user.grupNama=='Pegawai'){
      Timer(Duration(seconds: 5), (){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreenPegawai()));
      });
    }else{
      Timer(Duration(seconds: 5), (){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainScreenKadin()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Center(child: Container(height: 50, width:50,child: CircularProgressIndicator(),),),
    );
  }
}
