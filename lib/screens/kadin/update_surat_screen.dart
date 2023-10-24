part of 'kadin_screens.dart';

class UpdateSuratScreen extends StatefulWidget {
  final Surat surat;
  UpdateSuratScreen(this.surat);

  @override
  State<UpdateSuratScreen> createState() => _UpdateSuratScreenState();
}

class _UpdateSuratScreenState extends State<UpdateSuratScreen> {
  String urlFinal = '';
  getInit() async {
    await Provider.of<BeritaProvider>(context, listen: false).getBeritas();
    await Provider.of<PegawaiProvider>(context, listen: false).getPegawais();
    await Provider.of<SuratProvider>(context, listen: false).getSurats();
    Navigator.pop(context);
    setState(() {});
  }
  static void downloadSurat(String type, String idSurat) async {
    Uri uri =
    Uri.parse('${AppUrl.downloadUrl}'+'${type}/'+idSurat+AppUrl.pdfSlash);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString(),forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
       );
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
  void navigateTo(String type, String idSurat) async {
    var uri = Uri.parse('https://pemkot.digitaline.site/backoffice/'+'${type}/'+'${idSurat}/pdf');
    if (await canLaunch(uri.toString())) {
      showSuccess('Mendownload Surat..');
      await launch(uri.toString());
    } else {
      showError('Gagal Download');
      throw 'Could not launch ${uri.toString()}';
    }
  }
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    SuratProvider suratProvider = Provider.of<SuratProvider>(context);
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Text(
            'Permohonan Pembuatan Surat',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jenis Surat : ${widget.surat.suratJenis}'),
                Text('Nama Pemohon : ${widget.surat.suratNama}'),

              ],
            ),
          )
        ],
      );
    }

    Widget timeline() {
      return Column(
        children: [
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: true,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: widget.surat.suratStatus == '3'
                  ? Color(0xFFFF0000)
                  : Color(0xFF27AA69),
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              asset: 'assets/logopemkot.png',
              title: widget.surat.suratStatus == '3'
                  ? 'Surat Ditolak'
                  : 'Surat Diterima',
              message: widget.surat.suratStatus == '3'
                  ? 'Surat Permohonan Ditolak'
                  : 'Permohonan Surat Diterima',
            ),
            beforeLineStyle: LineStyle(
              color: widget.surat.suratStatus == '3'
                  ? Color(0xFFFF0000)
                  : Color(0xFF27AA69),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: widget.surat.suratStatus == '2'
                  ? Color(0xFF27AA69)
                  : widget.surat.suratStatus == '4'
                      ? Color(0xFF27AA69)
                      : Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              disabled: widget.surat.suratStatus == '2'
                  ? false
                  : widget.surat.suratStatus == '4'
                      ? false
                      : true,
              asset: 'assets/logopemkot.png',
              title: 'Validasi',
              message: 'Permohonan Surat Diproses',
            ),
            beforeLineStyle: LineStyle(
              color: widget.surat.suratStatus == '2'
                  ? Color(0xFF27AA69)
                  : widget.surat.suratStatus == '4'
                      ? Color(0xFF27AA69)
                      : Color(0xFFDADADA),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: widget.surat.suratStatus == '4'
                  ? Color(0xFF27AA69)
                  : Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              disabled: widget.surat.suratStatus == '4' ? false : true,
              asset: 'assets/logopemkot.png',
              title: 'Persetujuan',
              message: 'Surat Ditanda tangani Kepala Dinas',
            ),
            beforeLineStyle: LineStyle(
              color: widget.surat.suratStatus == '4'
                  ? Color(0xFF27AA69)
                  : Color(0xFFDADADA),
            ),
            afterLineStyle: LineStyle(
              color: widget.surat.suratStatus == '4'
                  ? Color(0xFF27AA69)
                  : Color(0xFFDADADA),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isLast: true,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: widget.surat.suratStatus == '4'
                  ? Color(0xFF27AA69)
                  : Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: _RightChild(
              disabled: widget.surat.suratStatus == '4' ? false : true,
              asset: 'assets/logopemkot.png',
              title: 'Surat Permohonan Selesai',
              message: 'Surat bisa di Diambil/Print Pdf',
            ),
            beforeLineStyle: LineStyle(
              color: widget.surat.suratStatus == '4'
                  ? Color(0xFF27AA69)
                  : Color(0xFFDADADA),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 20),
            header(),
            timeline(),

          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              userProvider.user.grupNama != 'Masyarakat'
                  ? Expanded(
                      flex: 1,
                      child: widget.surat.suratStatus == '2'
                          ? SizedBox()
                          : widget.surat.suratStatus == '4'
                              ? SizedBox()
                              : widget.surat.suratStatus == '3'
                                  ? SizedBox()
                                  : CupertinoButton(child: Text('Tolak'),onPressed: ()async{
                        Surat? valSurat = await suratProvider
                            .postValidasiPegawai(
                            widget.surat.suratId!, '3');
                        if (valSurat!.status = true) {
                          showSuccess(valSurat.message!);
                          getInit();
                        } else {
                          showError(valSurat.message!);
                        }
                      },))
                  : SizedBox(
                      width: 10,
                    ),
              SizedBox(
                width: 10,
              ),

              Expanded(
                  flex: 1,
                  child: userProvider.user.grupNama == 'Pegawai' &&
                          widget.surat.suratStatus == '1'
                      ? CupertinoButton(child: Text('Validasi Pegawai'), onPressed: ()async{
                    print(widget.surat.suratId);
                    print('2');
                    Surat? valSurat = await suratProvider
                        .postValidasiPegawai(widget.surat.suratId!, '2');
                    if (valSurat!.status = true) {
                      showSuccess(valSurat.message!);
                      getInit();
                    } else {
                      showError(valSurat.message!);
                    }
                  })
                      : userProvider.user.grupNama == 'Kepala Dinas' &&
                              widget.surat.suratStatus == '2'
                          ?CupertinoButton(child: Text('Validasi Kepala Dinas'), onPressed: ()async{
                    Surat? valSurat = await suratProvider
                        .postValidasiKadin(widget.surat.suratId!, '4');
                    if (valSurat!.status = true) {
                      showSuccess(valSurat.message!);
                      getInit();
                    } else {
                      showError(valSurat.message!);
                    }
                  })
                          : widget.surat.suratStatus == '4' &&
                                      userProvider.user.grupNama ==
                                          'Masyarakat' ||
                      widget.surat.suratStatus == '4' &&  userProvider.user.grupNama ==
                                      'Kepala Dinas' ||
                      widget.surat.suratStatus == '4' && userProvider.user.grupNama == 'Pegawai'
                              ?CupertinoButton(child: Text('Download'), onPressed: ()async{
                    String hasil = await widget.surat.suratJenis=='Surat Keterangan Pindah'?'surat-pindah':widget.surat.suratJenis=='Surat Kematian'?'surat-kematian':'surat-belum-menikah';
                    setState(() {
                      urlFinal = hasil;
                    });
                    print(urlFinal);
                    navigateTo(urlFinal,widget.surat.suratId!);
                  })
                              : SizedBox())
            ],
          ),
        ));
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

class _RightChild extends StatelessWidget {
  const _RightChild({
    super.key,
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
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Opacity(
            child: Image.asset(asset, height: 50),
            opacity: disabled ? 0.5 : 1,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: disabled ? Color(0xFFBABABA) : Color(0xFF636564),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: disabled ? Color(0xFFD5D5D5) : Color(0xFF636564),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
