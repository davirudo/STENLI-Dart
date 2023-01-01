import 'package:intl/intl.dart';

class AppFormat {
  static String currency(String number) {
    return NumberFormat.currency(
      decimalDigits: 2,
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(double.parse(number));
  }
}
