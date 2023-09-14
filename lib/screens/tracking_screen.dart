part of 'screens.dart';
class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isFirst: true,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFF27AA69),
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              asset: 'assets/logopemkot.png',
              title: 'Diterima Petugas',
              message: 'kami menerima surat anda',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFF27AA69),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              disabled: true,
              asset: 'assets/logopemkot.png',
              title: 'Validasi',
              message: 'surat sedang dalam tahap validasi',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              disabled: true,
              asset: 'assets/logopemkot.png',
              title: 'Persetujuan',
              message: 'menunggu persetujuan Kepala Dinas',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
            afterLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),
          ),
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.1,
            isLast: true,
            indicatorStyle: const IndicatorStyle(
              width: 20,
              color: Color(0xFFDADADA),
              padding: EdgeInsets.all(6),
            ),
            endChild: const _RightChild(
              disabled: true,
              asset: 'assets/logopemkot.png',
              title: 'Selesai',
              message: 'surat berhasil dibuat',
            ),
            beforeLineStyle: const LineStyle(
              color: Color(0xFFDADADA),
            ),),



        ],
      ),
    );
  }
}
