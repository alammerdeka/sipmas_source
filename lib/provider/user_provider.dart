part of 'providers.dart';
class UserProvider with ChangeNotifier {
  User _user;
  User get user => _user;
  set user(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  void setuser(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  List<User> _listUsers = [];
  List<User> get listUsers => _listUsers;
  set listUsers(List<User> listUsers) {
    _listUsers = listUsers;
    notifyListeners();
  }

  set surats(List<User> listUsers) {
    _listUsers = listUsers;
    notifyListeners();
  }

  Future<void> getMasyarakat() async {
    try {
      List<User> listUsers = await FutureServices().getMasyarakat();
      _listUsers = listUsers;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUsers(String id) async {
    try {
      User users = await FutureServices().getUser(id);
      _user = users;
    } catch (e) {
      print(e);
    }
  }
}