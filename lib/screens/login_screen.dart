part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isLoading = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var userLogin = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:30.0, vertical :15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 36),
                Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Image.asset('assets/logopemkot.png',width: 150,height: 150,),
                  Text(
                    'KELURAHAN SERANG',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(' JL.Empat Lima  SERANG, BANTEN'),
                ],),),
                SizedBox(height: 36),
                Text(
                  'Silahkan Login',
                  textAlign: TextAlign.left,style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 5),
                SizedBox(height: 16),
                Container(
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    decoration: fieldPrefIcon(Icon(Icons.person), 'Email'),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: fieldPrefIcon(Icon(Icons.password), 'Password')),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 1,
                        child: longButtonsGrey(100,'Daftar',(){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterScreen()));
                        })),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 2,
                      child: _isLoading?longButtons(100,'Login', () async {
                       setState(() {
                         _isLoading=false;
                       });
                        print(emailController.text);
                        print(passwordController.text);
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          showError('Field tidak boleh kosong');
                          setState(() {
                            _isLoading=true;
                          });
                        } else {

                          User loginAuth = await userLogin.userLogin(
                              emailController.text, passwordController.text);
                          if(loginAuth.status==false){
                            setState(() {
                              _isLoading=true;
                            });
                            print(loginAuth.identity);
                            print(loginAuth.message);
                            loginAuth!=null?showError(loginAuth.message):null;
                            loginAuth.identity!=null?showError(loginAuth.identity):null;
                          }else{
                            showSuccess('Login berhasil');
                            userProvider.user = loginAuth;
                            Navigator.pushReplacementNamed(context, '/validator');
                          }
                        }
                      }):Container(height: 50,width:50,child: Center(child: CircularProgressIndicator(),),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(message!=null?message:'')));
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(message!=null?message:'')));
  }
}
