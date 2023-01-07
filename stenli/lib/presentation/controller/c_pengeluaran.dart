import 'package:get/get.dart';
import 'package:stenli/data/model/pemasukan.dart';
import 'package:stenli/data/model/user.dart';
import 'package:stenli/data/source/source_pemasukan.dart';
import 'package:stenli/data/source/source_pengeluaran.dart';

class CPengeluaran extends GetxController {
  final _total = 0.0.obs;
  double get total => _total.value;
  getAnalysis() async {
    Map data = await SourcePengeluaran.PengeluaranList();

    double tinggal = data['tinggal'].toDouble();
    double air = data['air'].toDouble();
    double internet = data['internet'].toDouble();
    double keluarga = data['keluarga'].toDouble();
    double makan = data['makan'].toDouble();
    double bensin = data['bensin'].toDouble();
    double peliharaan = data['peliharaan'].toDouble();
    double donasi = data['donasi'].toDouble();
    double belanja = data['belanja'].toDouble();
    double hiburan = data['hiburan'].toDouble();
    double olahraga = data['olahraga'].toDouble();
    double edukasi = data['edukasi'].toDouble();
    double lainnya = data['lainnya'].toDouble();
    _total.value = (tinggal +
            air +
            internet +
            keluarga +
            makan +
            bensin +
            peliharaan +
            donasi +
            belanja +
            hiburan +
            olahraga +
            edukasi +
            lainnya)
        .abs();
  }
}
