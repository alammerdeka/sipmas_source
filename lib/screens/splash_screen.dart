part of 'screens.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getInit();
    super.initState();
  }
  getInit() async {
    await Provider.of<BeritaProvider>(context, listen:false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen:false).getPegawais();
    await Provider.of<SuratProvider>(context, listen:false).getSurats();
    await Provider.of<UserProvider>(context, listen:false).getMasyarakat();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),),),
    );
  }
}
