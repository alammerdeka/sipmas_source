part of 'kadin_screens.dart';
class UpdateProfileScreen extends StatefulWidget {
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {


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

  getInit() async {
    await Provider.of<BeritaProvider>(context, listen:false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen:false).getPegawais();
    await Provider.of<SuratProvider>(context, listen:false).getSurats();
    setState(() {

    });
    Navigator.pop(context);
  }

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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                'Ubah Profile',
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
                  decoration: fieldPrefIcon(Icon(Icons.person), userProvider.user.pengNama!=null?userProvider.user.pengNama:''),
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
                  decoration: fieldPrefIcon(Icon(Icons.workspaces), userProvider.user.pengNik!=null?userProvider.user.pengNik:''),
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
                  fieldPrefIcon(Icon(Icons.water_damage_outlined),  userProvider.user.pengTempat!=null?userProvider.user.pengTempat:''),
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
                            ? userProvider.user.pengTanggal!=null?userProvider.user.pengTanggal:'  Pilih Tanggal'
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
                  labelText: userProvider.user.pengJenisKelamin!=null?userProvider.user.pengJenisKelamin:'Pilih',
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
                  labelText: userProvider.user.pengAgama!=null?userProvider.user.pengAgama:'Pilih',
                  items: listAgama,
                  onChanged: (value) => selectAgama =value,
                  onSaved: (value) => selectAgama =value,
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
                  labelText: userProvider.user.pengStatusKawin!=null?userProvider.user.pengStatusKawin:'Pilih',
                  items: listKawin,
                  onChanged: (value) => selectKawin = value,
                  onSaved: (value) => selectKawin = value,
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
                    fieldPrefIcon(Icon(Icons.location_on_sharp), userProvider.user.pengAlamat!=null?userProvider.user.pengAlamat:'Pilih')),
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
                    decoration: fieldPrefIcon(Icon(Icons.phone), userProvider.user.pengTlp!=null?userProvider.user.pengTlp:'Pilih')),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Instansi',
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
                  labelText: userProvider.user.pengInstansi!=null?userProvider.user.pengInstansi:'Pilih',
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
                    enabled: false,
                    decoration: fieldPrefIcon(Icon(Icons.email), userProvider.user.pengEmail!=null?userProvider.user.pengEmail:'')),
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
              _isLoading?longButtons(MediaQuery.of(context).size.width,'Ubah', () async {
                setState(() {
                  _isLoading = false;
                });
                User user = await authProvider.editPegawai(
                    userProvider.user.pengId,
                    namaController.text.isEmpty?userProvider.user.pengNama:namaController.text,
                    nikController.text.isEmpty?userProvider.user.pengNik:nikController.text,
                    tempatController.text.isEmpty?userProvider.user.pengTempat:tempatController.text,
                    _textDate==null?userProvider.user.pengTanggal:_textDate,
                    selectJenkel.isEmpty?userProvider.user.pengJenisKelamin:selectJenkel,
                    selectAgama.isEmpty?userProvider.user.pengAgama:selectAgama,
                    selectKawin.isEmpty?userProvider.user.pengStatusKawin:selectKawin,
                    alamatController.text.isEmpty?userProvider.user.pengAlamat:alamatController.text,
                    telpController.text.isEmpty?userProvider.user.pengTlp:telpController.text,
                    selectInstansi.isEmpty?userProvider.user.pengInstansi:selectInstansi,
                    userProvider.user.pengEmail,
                    passwordController.text.isEmpty?'':'',
                    passwordController.text.isEmpty?'':'',
                    userProvider.user.grupNama=='Kepala Dinas'?'6':userProvider.user.grupNama=='Masyarakat'?'7':userProvider.user.grupNama=='Pegawai'?'5':'6',
                    '1');
                if (user.status == false) {
                  setState(() {
                    _isLoading = true;
                  });
                  print(user.pengPass);
                  showError(user.pengPass);
                } else {
                  showSuccess('Berhasil ubah profile');

                  getInit();

                }
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

  void showBroadcast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black54,
        content: Text(message)));
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(message)));
  }
}
