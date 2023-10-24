part of 'pegawai_screens.dart';
class MainScreenPegawai extends StatefulWidget {
  const MainScreenPegawai({super.key});

  @override
  State<MainScreenPegawai> createState() => _MainScreenPegawaiState();
}

class _MainScreenPegawaiState extends State<MainScreenPegawai> {
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

            padding: const EdgeInsets.all(14),
            child: const Text("Jangan"),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
          },
          child: Container(
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
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
             PegawaiHomeScreen(),
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
              icon: Icon(Icons.people),
              title: Text('Users'),
              activeColor: Colors.black,
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
    );

  }
}

