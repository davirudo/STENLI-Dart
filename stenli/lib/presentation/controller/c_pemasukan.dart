import 'package:get/get.dart';
import 'package:stenli/data/model/pemasukan.dart';
import 'package:stenli/data/model/user.dart';
import 'package:stenli/data/source/source_pemasukan.dart';

class CPemasukan extends GetxController {
  final _today = 0.0.obs;
  double get today => _today.value;

  getAnalysis() async {
    Map data = await SourcePemasukan.PemasukanList();

    _today.value = data['pemasukan'].toDouble();
  }
}
