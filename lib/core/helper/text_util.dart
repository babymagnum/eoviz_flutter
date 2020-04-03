import 'dart:convert';
import 'package:intl/intl.dart';

abstract class TextUtil {
  static bool validateName(String text) {
    return text
        .contains(RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"));
  }

  static bool validateNumber(String text) {
    Pattern pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool validateEmail(String text) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool isImageFromInternet(String text) {
    Pattern pattern = 'http|https|www';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(text);
  }

  static bool validatePassword(String text) {
    return text.toString().length >= 6;
  }

  static String convertMapToString(Map<dynamic, dynamic> data) {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(data);
  }

  static String capitalize(String value) {
    return (value.length > 0)
        ? value[0].toUpperCase() + value.substring(1)
        : value[0].toUpperCase();
  }

  static String toRupiah(int value) {
    return "Rp ${value.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";
  }

  static String convertDateStringToAnotherFormat(String dateString, String pattern, String originPattern) {
    DateFormat originFormat = DateFormat(originPattern);
    DateFormat finalFormat = DateFormat(pattern);
    DateTime dateTime = originFormat.parse(dateString);
    return finalFormat.format(dateTime);
  }

  static String getCurrentDate(String pattern) {
    return DateFormat(pattern).format(DateTime.now());
  }

  static String getDay() {
    final currentDay = getCurrentDate('EEE');
    if (currentDay == 'Sun') return 'Minggu';
    else if (currentDay == 'Mon') return 'Senin';
    else if (currentDay == 'Tue') return 'Selasa';
    else if (currentDay == 'Wed') return 'Rabu';
    else if (currentDay == 'Thu') return 'Kamis';
    else if (currentDay == 'Fri') return 'Jumat';
    else if (currentDay == 'Sat') return 'Sabtu';
  }
}
