import 'dart:convert';

import 'package:d_info/d_info.dart';
import 'package:stenli/data/model/pemasukan.dart';

import '../../config/api.dart';
import '../../config/app_request.dart';
import '../../config/session.dart';
import '../model/user.dart';

class SourcePengeluaran {
  static Future<bool> post(
      String tinggal,
      String air,
      String internet,
      String keluarga,
      String makan,
      String bensin,
      String peliharaan,
      String donasi,
      String belanja,
      String hiburan,
      String olahraga,
      String edukasi,
      String lainnya) async {
    String url = '${Api.pengeluaran}/pengeluaran_post.php';
    Map? responseBody = await AppRequest.post(url, '', {
      'tinggal': tinggal,
      'air': air,
      'internet': internet,
      'keluarga': keluarga,
      'makan': makan,
      'bensin': bensin,
      'peliharaan': peliharaan,
      'donasi': donasi,
      'belanja': belanja,
      'hiburan': hiburan,
      'olahraga': olahraga,
      'edukasi': edukasi,
      'lainnya': lainnya,
    });
    if (responseBody == null) return false;

    if (responseBody['success']) {
      DInfo.dialogSuccess('Berhasil update');
      DInfo.closeDialog();
    } else {
      if (responseBody['message'] == 'nama') {
        DInfo.dialogError('nama sudah terdaftar');
      } else {
        DInfo.dialogError('Gagal update');
      }
      DInfo.closeDialog();
    }

    return responseBody['success'];
  }

  static Future<Map> PengeluaranList() async {
    String url = '${Api.pengeluaran}/pengeluaran_list.php';
    Map? responseBody = await AppRequest.post(url, '', {});

    if (responseBody == null) {
      return {'pemasukan': 420.69};
    }

    return responseBody;
  }
}
