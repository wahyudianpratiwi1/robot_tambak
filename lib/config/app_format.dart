import 'package:intl/intl.dart';

class AppFormat {
  static String data(String stringData) {
    DateTime dateTime = DateTime.parse(stringData);
    return DateFormat('d MMMM yyyy', 'id_ID').format(dateTime);
  }

  static String dateMonth(String stringData) {
    DateTime dateTime = DateTime.parse(stringData);
    return DateFormat('d MMMM', 'id_ID').format(dateTime);
  }

  static String currency(double number) {
    return NumberFormat.currency(
      decimalDigits: 0,
      locale: 'id_ID',
      symbol: 'Rp ',
    ).format(number);
  }
}
