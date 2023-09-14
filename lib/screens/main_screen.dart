part of 'screens.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<bool> _willPopCallback() async {
    showDialog( context: context, builder: (_)=>AlertDialog(
      title: const Text("Anda yakin keluar aplikasi?"),
      content: const Text("keluar aplikasi memungkinkan anda untuk melakukan login ulang"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.grey,
            padding: const EdgeInsets.all(14),
            child: const Text("Jangan"),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
          },
          child: Container(
            color: Colors.grey,
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
    SuratProvider suratProvider = Provider.of<SuratProvider>(context);
    return  WillPopScope(
        onWillPop: _willPopCallback,
        child: Scaffold(
          body: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: <Widget>[
                BerandaScreen(),
                DataSuratMasyarakatScreen(),
                KadinProfileScreen(),

              ],
            ),
          ),

          bottomNavigationBar: BottomNavyBar(
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: (index) {
              setState(() => _currentIndex = index);
              _pageController.jumpToPage(index);
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.insert_drive_file_rounded),
                title: Text('Surat'),
                activeColor: Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.account_circle),
                title: Text(
                  'Profil',
                ),
                activeColor: Colors.black,
                textAlign: TextAlign.center,
              ),

            ],
          ),
        ),
    );

  }
}
