import 'dart:convert';

import 'package:d_info/d_info.dart';
import 'package:get/get.dart';
import 'package:stenli/data/model/pemasukan.dart';

import '../../config/api.dart';
import '../../config/app_request.dart';
import '../../config/session.dart';
import '../../presentation/controller/c_pemasukan.dart';
import '../../presentation/page/feature/pemasukan_page.dart';
import '../model/user.dart';

class SourcePemasukan {
  
  static Future<bool> post(String pemasukan) async {
    String url = '${Api.pemasukan}/pemasukan_post.php';
    Map? responseBody = await AppRequest.post(url, '', {
      'pemasukan': pemasukan,
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

  static Future<Map> PemasukanList() async {
    String url = '${Api.pemasukan}/pemasukan_list.php';
    Map? responseBody = await AppRequest.post(url, '', {});

    if (responseBody == null) {
      return {'pemasukan': 420.69};
    }

    return responseBody;
  }
}
