import 'package:get/get.dart';
import 'package:stenli/data/model/pemasukan.dart';
import 'package:stenli/data/model/user.dart';
import 'package:stenli/data/source/source_pemasukan.dart';
import 'package:stenli/data/source/source_pengeluaran.dart';

class CPengeluaran extends GetxController {
  RxDouble? _total = 0.0.obs;
  double get total => _total!.value;

  RxDouble? _totaldarurat = 0.0.obs;
  double get totaldarurat => _totaldarurat!.value;

  RxDouble? _fixed = 0.0.obs;
  double get fixed => _fixed!.value;

  RxDouble? _fixeddarurat = 0.0.obs;
  double get fixeddarurat => _fixeddarurat!.value;

  RxDouble? _variable = 0.0.obs;
  double get variable => _variable!.value;

  RxDouble? _variabledarurat = 0.0.obs;
  double get variabledarurat => _variabledarurat!.value;

  RxDouble? _sisihan = 0.0.obs;
  double get sisihan => _sisihan!.value;

  RxDouble? _ppb = 0.0.obs;
  double get ppb => _ppb!.value;

  RxDouble? _ppm = 0.0.obs;
  double get ppm => _ppm!.value;

  RxDouble? _ddpb = 0.0.obs;
  double get ddpb => _ddpb!.value;

  RxDouble? _menabung = 0.0.obs;
  double get menabung => _menabung!.value.toPrecision(1);

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
    _fixed!.value = (tinggal + air + internet + keluarga).abs();

    _variable!.value = (makan +
            bensin +
            peliharaan +
            donasi +
            belanja +
            hiburan +
            olahraga +
            edukasi +
            lainnya)
        .abs();

    _fixeddarurat!.value = (fixed * 6);

    _variabledarurat!.value = (variable * 6);

    _total!.value = (tinggal +
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
    _totaldarurat!.value = (total * 6);
  }

  HitungMenabung(double target, double pendapatan) async {
    double hasil = (pendapatan - fixed);
    _sisihan!.value = (hasil * 10 / 100);
    _menabung!.value = (target / sisihan);
  }

  Batas() async {
    _ppb!.value = (total / 5);
    _ppm!.value = (ppb - (ppb / 4));
    _ddpb!.value = (ppb * 4);
  }
}
