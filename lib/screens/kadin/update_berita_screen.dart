part of 'kadin_screens.dart';

class UpdateBeritaScreen extends StatefulWidget {
  final Berita berita;
  UpdateBeritaScreen(this.berita);

  @override
  State<UpdateBeritaScreen> createState() => _UpdateBeritaScreenState();
}

class _UpdateBeritaScreenState extends State<UpdateBeritaScreen> {
  TextEditingController judulController = TextEditingController();
  TextEditingController isiController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isUploading = false;
  File uploadimage;
  File imageFile;
  final picker = ImagePicker();
  List<int> showw = [];

  getInit() async {
    await Provider.of<BeritaProvider>(context, listen: false).getBeritas();
    Navigator.pop(context);
  }

  Future<void> chooseImage() async {
    var choosedimage = await picker.getImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = File(choosedimage.path);
    });
  }

  Future addProduct(String beritaId, String beritaJudul,
      String beritaIsi,File imageFile) async {
// ignore: deprecated_member_use
    var stream = new http.ByteStream(imageFile.openRead());
    var length = await imageFile.length();
    var uri = Uri.parse(
      '${AppUrl.putBerita}',
    );

    var request = new http.MultipartRequest(
      "POST",
      uri,
    );

    var multipartFile = new http.MultipartFile("beritaGambar", stream, length,
        filename: (imageFile.path));


    request.fields['beritaId'] = beritaId;
    request.fields['beritaJudul'] = beritaJudul;
    request.fields['beritaIsi'] = beritaIsi;
    request.files.add(multipartFile);
    print(beritaId);
    print(beritaJudul);
    print(beritaIsi);
    var respond = await request.send();
    if (respond.statusCode == 200) {
      print("Image Uploaded");
      var responseData = await respond.stream.toBytes();
      var result = String.fromCharCodes(responseData);
      setState(() {
        showw = responseData.toList();
        _isUploading = false;
      });

      showSuccess('Berhasil ubah berita');
      getInit();

      print(result);
    } else {
      var responseData = await respond.stream.toBytes();
      var result = String.fromCharCodes(responseData);
      showError('Gagal ubah berita');
      setState(() {
        _isUploading = false;
      });
      print('GAGAL${result}');
    }
  }

  @override
  Widget build(BuildContext context) {
   BeritaProvider beritaProvider = Provider.of<BeritaProvider>(context);

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
                'Ubah Berita',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 5),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Judul Berita',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                  controller: judulController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: widget.berita.beritaId != null
                          ? widget.berita.beritaJudul
                          : ''),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Isi Berita',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                  controller: isiController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: widget.berita.beritaId != null
                          ? widget.berita.beritaIsi
                          : ''),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 2),
                child: Text(
                  'Gambar',
                ),
              ),
              Container(
                  //show image here after choosing image
                  child: uploadimage == null
                      ? Container(
                          margin: EdgeInsets.only(bottom: 12),
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              child: Image.asset(
                                  'assets/blank.jpeg') //load image from file
                              ))
                      : //if uploadimage is null then show empty container
                      Container(
                          //elese show image here
                          margin: EdgeInsets.only(bottom: 12),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(uploadimage) //
                                ),
                          ))),

              uploadimage==null?longButtonsGrey(100, 'Pilih Gambar', (){chooseImage();}):
              longButtons(100, 'Simpan Berita', (){  addProduct(
                  widget.berita.beritaId,
                  judulController.text.isEmpty
                      ? widget.berita.beritaJudul
                      : judulController.text,
                  isiController.text.isEmpty?widget.berita.beritaIsi:isiController.text,uploadimage,);}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: ()async{
         Berita ber = await beritaProvider.deleteBerita(widget.berita.beritaId);
         if(ber.status=false){
           showError(ber.message);
         }else{
           showSuccess(ber.message);
           getInit();
         }
        },
        child: Center(child: Icon(Icons.delete_forever),),),
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
