part of 'kadin_screens.dart';

class KadinProfileScreen extends StatefulWidget {
  const KadinProfileScreen({Key key}) : super(key: key);

  @override
  State<KadinProfileScreen> createState() => _KadinProfileScreenState();
}

class _KadinProfileScreenState extends State<KadinProfileScreen> {
  getInit(String id) async {
    await Provider.of<BeritaProvider>(context, listen:false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen:false).getPegawais();
    await Provider.of<SuratProvider>(context, listen:false).getSurats();
    await Provider.of<UserProvider>(context, listen: false).getUsers(id);
    setState(() {

    });
  }

  Future<bool> signOut() async {
    showDialog( context: context, builder: (_)=>AlertDialog(
      title: const Text("Anda yakin keluar aplikasi?"),
      content: const Text("keluar aplikasi memungkinkan anda untuk melakukan login ulang"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(14),
            child: const Text("Jangan"),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
          },
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(14),
            child: const Text("Keluar"),
          ),
        ),
      ],
    ));
    return true; // return true if the route to be popped
  }
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    Widget header() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 2,
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(userProvider.user.pengNama, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  Text(userProvider.user.grupNama!=null?userProvider.user.grupNama:''),
                ],),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>UpdateProfileScreen()));
                    },
                    child: Icon(Icons.edit)),
              ],),
            ),
            Text(
              'Informasi Umum',
              style: TextStyle(fontWeight: FontWeight.bold),

            ),
            SizedBox(height: 10,),
            valueProfile('Email',userProvider.user.pengEmail,(){}),
            valueProfile('Telepon',userProvider.user.pengTlp,(){}),
            valueProfile('Tempat, Tanggal Lahir','${userProvider.user.pengTempat},${userProvider.user.pengTanggal}',(){}),
            // valueProfile(userProvider.user.pengJenisKelamin,(){}),
            // valueProfile(userProvider.user.pengStatusKawin,(){}),
            // valueProfile(userProvider.user.pengAlamat,(){}),
            // valueProfile(userProvider.user.pengInstansi,(){}),

            Text(
              'Lainnya',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            valueProfile('Keluar','Keluar Aplikasi',signOut),
          ],
        ),
      );
    }


    return RefreshIndicator(
      onRefresh: ()=>getInit(userProvider.user.pengId),
      child: Scaffold(
        body: ListView(
          children: [header()],
        ),
      ),
    );
  }

  Widget valueProfile(String title, String name, Function fun) {
    return GestureDetector(
      onTap: ()=> fun(),
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: TextStyle(color: Colors.grey, fontSize: 12),),
            SizedBox(height: 4,),
            Text(name, style: TextStyle(color: Colors.black, fontSize: 14),),
          ],
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        ),
      ),
    );
  }


}
