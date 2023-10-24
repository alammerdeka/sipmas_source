part of 'screens.dart';

class SuratPindahScreen extends StatefulWidget {
  const SuratPindahScreen({super.key});

  @override
  State<SuratPindahScreen> createState() => _SuratPindahScreenState();
}

class _SuratPindahScreenState extends State<SuratPindahScreen> {

  TextEditingController namaController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController tempatController = TextEditingController();
  TextEditingController agamaController = TextEditingController();
  TextEditingController kawinController = TextEditingController();
  TextEditingController jenkelController = TextEditingController();
  TextEditingController instansiController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController pindahKeController = TextEditingController();
  TextEditingController alasanPindahController = TextEditingController();
  TextEditingController pengikutPindahController = TextEditingController();


  DateTime? _dateTime;
  String? _textDate;
  String selectJenkel = "";
  String selectAgama = "";
  String selectKawin = "";
  String selectInstansi = "";
  bool _isLoading = true;
  final formKey = GlobalKey<FormState>();

  var myFormat = DateFormat('d-MM-yyyy');
  Future<Null> selectedTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
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


  getInit(String id) async {
    await Provider.of<BeritaProvider>(context, listen:false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen:false).getPegawais();
    await Provider.of<SuratProvider>(context, listen:false).getSuratsById(id);
    Navigator.pop(context);
    setState(() {

    });
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    SuratProvider suratProvider = Provider.of<SuratProvider>(context);
    Widget untukSaya() {
      return Expanded(
        child: Container(
            margin: EdgeInsets.only(bottom: 60),
            width: double.infinity,
            child: (selectedIndex == 0)
                ? Form(
                    key: formKey,
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(

                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(
                                Icon(Icons.account_circle),
                                userProvider.user.pengNama!),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(

                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(
                                Icon(Icons.fact_check_rounded),
                                userProvider.user.pengNik!),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(

                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(Icon(Icons.home_filled),
                                userProvider.user.pengTempat!),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(

                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(Icon(Icons.date_range),
                                userProvider.user.pengTanggal!),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(

                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(
                                Icon(Icons.grade), userProvider.user.pengAgama!),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(

                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(
                                Icon(Icons.dataset_rounded),
                                userProvider.user.pengStatusKawin!),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(

                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(Icon(Icons.transgender),
                                userProvider.user.pengJenisKelamin!),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(

                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(
                                Icon(Icons.account_balance_rounded),
                                userProvider.user.pengInstansi!),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(
                            enabled: false,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(Icon(Icons.location_on),
                                userProvider.user.pengAlamat!),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                          child: Text(
                            'Tujuan Pindah',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(
                            controller: pindahKeController,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(Icon(Icons.home), ''),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                          child: Text(
                            'Alasan Pindah',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(
                            controller: alasanPindahController,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(Icon(Icons.crisis_alert_rounded), ''),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                          child: Text(
                            'Pengikut',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 12.0),
                          child: TextFormField(
                            controller: pengikutPindahController,
                            keyboardType: TextInputType.text,
                            decoration: fieldPrefIcon(Icon(Icons.people), 'Gunakan koma jika pengikut lebih dari 1'),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        CupertinoButton(child: Text('Buat Surat'), onPressed: ()async{
                          if(  pindahKeController.text.isEmpty||
                              alasanPindahController.text.isEmpty||
                              pengikutPindahController.text.isEmpty){
                            showError('Data tidak boleh kosong');
                          }else {
                            Surat? postSurat = await suratProvider.postPindah(
                                userProvider.user.pengId!,
                                'Surat Keterangan Pindah',
                                userProvider.user.pengNama!,
                                userProvider.user.pengNik!,
                                userProvider.user.pengTempat!,
                                userProvider.user.pengTanggal!,
                                userProvider.user.pengAgama!,
                                userProvider.user.pengStatusKawin!,
                                userProvider.user.pengJenisKelamin!,
                                userProvider.user.pengInstansi!,
                                userProvider.user.pengAlamat!,
                                pindahKeController.text,
                                alasanPindahController.text,
                                pengikutPindahController.text
                            );
                            if (postSurat!.status == true) {
                              getInit(userProvider.user.pengId!);
                              showSuccess('Berhasil Buat Surat');
                            } else {
                              showError('Gagal Buat Surat');
                            }
                          }
                        })

                      ],
                    ),
                  )
                : ListView(
                    children: [
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
                                    : '  ${myFormat.format(_dateTime!)}',
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
                      //jenkel
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
                          onSaved: (value)  => selectAgama =value!,
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
                          onSaved: (value) =>  selectKawin = value!,
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
                              selectJenkel = value!;
                            });
                          },
                        ),
                      ),//status kawin
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
                          labelText: 'Shape',
                          items: listInstansi,
                          onChanged: (value) => selectInstansi = value,
                          onSaved: (value) => selectInstansi = value!,
                        ),
                      ),
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
                          'Tujuan Pindah',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12.0),
                        child: TextFormField(
                          controller: pindahKeController,
                          keyboardType: TextInputType.text,
                          decoration: fieldPrefIcon(Icon(Icons.home), ''),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                        child: Text(
                          'Alasan Pindah',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12.0),
                        child: TextFormField(
                          controller: alasanPindahController,
                          keyboardType: TextInputType.text,
                          decoration: fieldPrefIcon(Icon(Icons.crisis_alert_rounded), ''),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                        child: Text(
                          'Pengikut',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12.0),
                        child: TextFormField(
                          controller: pengikutPindahController,
                          keyboardType: TextInputType.text,
                          decoration: fieldPrefIcon(Icon(Icons.people), 'Gunakan koma jika pengikut lebih dari 1'),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      CupertinoButton(child: Text('Buat Surat'), onPressed: ()async{
                        print('lah');
                        print(namaController.text);
                        print(nikController.text);
                        print(tempatController.text);
                        print(_textDate);
                        print(selectJenkel);
                        print(selectAgama);
                        print(selectKawin);
                        print(alamatController.text);
                        print(selectInstansi);

                        if (namaController.text.isEmpty ||
                            nikController.text.isEmpty ||
                            tempatController.text.isEmpty ||
                            _textDate == null ||
                            selectJenkel.isEmpty ||
                            selectAgama.isEmpty ||
                            selectKawin.isEmpty ||
                            alamatController.text.isEmpty ||
                            selectInstansi.isEmpty||
                            pindahKeController.text.isEmpty||
                            alasanPindahController.text.isEmpty||
                            pengikutPindahController.text.isEmpty) {
                          showError('Data tidak boleh kosong');
                          setState(() {
                            _isLoading = true;
                          });
                        } else {
                          Surat? postSurat = await suratProvider.postPindah(
                              userProvider.user.pengId!,
                              namaController.text,
                              'Surat Keterangan Pindah',
                              nikController.text,
                              tempatController.text,
                              _textDate!,
                              selectJenkel!,
                              selectAgama!,
                              selectKawin!,
                              alamatController.text,
                              selectInstansi,
                              pindahKeController.text,
                              alasanPindahController.text,
                              pengikutPindahController.text);
                          if (postSurat!.status == true) {
                            getInit(userProvider.user.pengId!);
                            showSuccess('Berhasil Buat Surat');
                          } else {
                            showError('Gagal Buat Surat');
                          }
                        }
                      })

                    ],
                  )),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text('Buat Surat Keterangan Pindah'),
              SizedBox(height: 20),
              CustomTabbar(
                titles: ['Untuk Saya', 'Untuk Orang Lain'],
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
      'value': 'Sudah Bekerja',
      'label': 'Sudah Bekerja',
      'icon': Icon(Icons.fiber_manual_record),
    },
  ];
}

class _RightChild extends StatelessWidget {
  const _RightChild({

    required this.asset,
    required this.title,
    required this.message,
    this.disabled = false,
  });

  final String asset;
  final String title;
  final String message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Opacity(
            child: Image.asset(asset, height: 50),
            opacity: disabled ? 0.5 : 1,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: disabled
                      ? const Color(0xFFBABABA)
                      : const Color(0xFF636564),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message,
                style: TextStyle(
                  color: disabled
                      ? const Color(0xFFD5D5D5)
                      : const Color(0xFF636564),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

