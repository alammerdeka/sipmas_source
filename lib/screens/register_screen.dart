part of 'screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController tempatController = TextEditingController();
  TextEditingController jenkelController = TextEditingController();
  TextEditingController agamaController = TextEditingController();
  TextEditingController kawinController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController instansiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DateTime _dateTime;
  String _textDate;
  String selectJenkel = "";
  String selectAgama = "";
  String selectKawin = "";
  String selectInstansi = "";
  bool _isLoading = true;
  final formKey = GlobalKey<FormState>();

  var myFormat = DateFormat('d-MM-yyyy');
  Future<Null> selectedTime(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        helpText: 'Tanggal Lahir',
        initialDate: DateTime.now(),
        firstDate: DateTime(1940),
        lastDate: DateTime(2030),
        initialDatePickerMode: DatePickerMode.year);
    if (picked != null && picked != _dateTime) {
      setState(() {
        _dateTime = picked;
        print(_dateTime.toString());
        _textDate = _dateTime.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Text(
                'Daftar',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 5),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Nama Lengkap',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: fieldPrefIcon(Icon(Icons.person), ''),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'NIK',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                  controller: nikController,
                  keyboardType: TextInputType.number,
                  decoration: fieldPrefIcon(Icon(Icons.workspaces), ''),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Tempat Lahir',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                  controller: tempatController,
                  keyboardType: TextInputType.text,
                  decoration:
                      fieldPrefIcon(Icon(Icons.water_damage_outlined), ''),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Tanggal Lahir',
                ),
              ),
              InkWell(
                onTap: () {
                  selectedTime(context);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: IgnorePointer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none)),
                        labelText: _textDate == null
                            ? '  Pilih Tanggal'
                            : '  ${myFormat.format(_dateTime)}',
                        labelStyle: _textDate == null
                            ? TextStyle(color: Colors.grey, fontSize: 14)
                            : TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Jenis Kelamin',
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.format_shapes),
                  labelText: 'Shape',
                  items: listJenisKelamin,
                  onChanged: (value){
                    setState(() {
                      selectJenkel = value;
                    });
                  },
                  onSaved: (value){
                    setState(() {
                      selectJenkel = value;
                    });
                  },
                ),
              ), //jenkel
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Agama',
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.format_shapes),
                  labelText: 'Shape',
                  items: listAgama,
                  onChanged: (value)  => selectAgama =value,
                  onSaved: (value)  => selectAgama =value,
                ),
              ), //agama
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Status Kawin',
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.format_shapes),
                  labelText: 'Shape',
                  items: listKawin,
                  onChanged: (value) =>  selectKawin = value,
                  onSaved: (value) =>  selectKawin = value,
                ),
              ), //status kawin
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Alamat Lengkap',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                    controller: alamatController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration:
                        fieldPrefIcon(Icon(Icons.location_on_sharp), '')),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'No. Handphone',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                    controller: telpController,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    decoration: fieldPrefIcon(Icon(Icons.phone), '')),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Pekerjaan',
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'circle',
                  icon: Icon(Icons.format_shapes),
                  labelText: 'Shape',
                  items: listInstansi,
                  onChanged: (value) => selectInstansi = value,
                  onSaved: (value) => selectInstansi = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Email',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: fieldPrefIcon(Icon(Icons.email), '')),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Password',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: fieldPrefIcon(Icon(Icons.lock), '')),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _isLoading?longButtons(MediaQuery.of(context).size.width,'Daftar', () async {
                setState(() {
                  _isLoading = false;
                });
                print(namaController.text);
                print(nikController.text);
                print(tempatController.text);
                print(_textDate);
                print(selectJenkel);
                print(selectAgama);
                print(selectKawin);
                print(alamatController.text);
                print(telpController.text);
                print(selectInstansi);
                print(emailController.text);
                print(passwordController.text);
                if (namaController.text.isEmpty ||
                    nikController.text.isEmpty ||
                    tempatController.text.isEmpty ||
                    _textDate == null ||
                    selectJenkel.isEmpty ||
                    selectAgama.isEmpty ||
                    selectKawin.isEmpty ||
                    alamatController.text.isEmpty ||
                    telpController.text.isEmpty ||
                    selectInstansi.isEmpty ||
                    emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  showError('Data tidak boleh kosong');
                  setState(() {
                    _isLoading = true;
                  });
                } else {

                  User user = await authProvider.registrasiUser(
                      namaController.text,
                      nikController.text,
                      tempatController.text,
                      _textDate,
                      selectJenkel,
                      selectAgama,
                      selectKawin,
                      alamatController.text,
                      telpController.text,
                      selectInstansi,
                      emailController.text,
                      passwordController.text);
                  if (user.status == false) {
                    setState(() {
                      _isLoading = true;
                    });
                    print(user.pengPass);
                    showError(user.pengPass);
                  } else {
                    showSuccess('Berhasil Daftar, Silahkan Login');
                    print('MASHOK');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));

                  }
                }
                ;
              }):Container(height: 50,width:50,child: Center(child: CircularProgressIndicator(),),),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(message)));
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(message)));
  }
}
final List<Map<String, dynamic>> listJenisKelamin = [
  {
    'value': 'Pria',
    'label': 'Pria',
    'icon': Icon(Icons.stop),
  },
  {
    'value': 'Wanita',
    'label': 'Wanita',
    'icon': Icon(Icons.fiber_manual_record),
  },
];
final List<Map<String, dynamic>> listAgama = [
  {
    'value': 'Budha',
    'label': 'Budha',
    'icon': Icon(Icons.stop),
  },
  {
    'value': 'Hindu',
    'label': 'Hindu',
    'icon': Icon(Icons.fiber_manual_record),
  },
  {
    'value': 'Islam',
    'label': 'Islam',
    'icon': Icon(Icons.fiber_manual_record),
  },
  {
    'value': 'Katolik',
    'label': 'Katolik',
    'icon': Icon(Icons.fiber_manual_record),
  },
  {
    'value': 'Kristen',
    'label': 'Kristen',
    'icon': Icon(Icons.fiber_manual_record),
  },
];
final List<Map<String, dynamic>> listKawin = [
  {
    'value': 'Belum Kawin',
    'label': 'Belum Kawin',
    'icon': Icon(Icons.stop),
  },
  {
    'value': 'Sudah Kawin',
    'label': 'Sudah Kawin',
    'icon': Icon(Icons.fiber_manual_record),
  },
];
final List<Map<String, dynamic>> listInstansi = [
  {
    'value': 'Belum Bekerja',
    'label': 'Belum Bekerja',
    'icon': Icon(Icons.stop),
  },
  {
    'value': 'Pegawai Negeri',
    'label': 'Pegawai Negeri',
    'icon': Icon(Icons.fiber_manual_record),
  },
  {
    'value': 'Pegawai Swasta',
    'label': 'Pegawai Swasta',
    'icon': Icon(Icons.fiber_manual_record),
  },
];
// List<String> listJenisKelamin = ["Pria", "Wanita"];
// List<String> listAgama = ["Budha", "Hindu", "Islam", "Katolik", "Kristen"];
// List<String> listKawin = ["Belum Kawin", "Sudah Kawin"];
// List<String> listInstansi = ["Belum Bekerja", "Sudah Bekerja"];
