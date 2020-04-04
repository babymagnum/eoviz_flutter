import 'dart:convert';
import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static String getDay(SharedPreferences preferences) {
    var language = preferences.getString(Constant.LANGUANGE_CODE) ?? Constant.INDONESIAN;

    final currentDay = getCurrentDate('EEE');
    if (currentDay == 'Sun') return language == Constant.INDONESIAN ? 'Minggu' : 'Sunday';
    else if (currentDay == 'Mon') return language == Constant.INDONESIAN ? 'Senin' : 'Monday';
    else if (currentDay == 'Tue') return language == Constant.INDONESIAN ? 'Selasa' : 'Tuesday';
    else if (currentDay == 'Wed') return language == Constant.INDONESIAN ? 'Rabu' : 'Wednesday';
    else if (currentDay == 'Thu') return language == Constant.INDONESIAN ? 'Kamis' : 'Thursday';
    else if (currentDay == 'Fri') return language == Constant.INDONESIAN ? 'Jumat' : 'Friday';
    else if (currentDay == 'Sat') return language == Constant.INDONESIAN ? 'Sabtu' : 'Saturday';
  }

  static String getMonth(int value, SharedPreferences preferences) {
    var language = preferences.getString(Constant.LANGUANGE_CODE) ?? Constant.INDONESIAN;

    if (language == Constant.ENGLISH) return getEnglishMonth(value);
    else return getIndonesiaMonth(value);
  }

  static String getIndonesiaMonth(int value) {
    if (value == 1) return 'Januari';
    else if (value == 2) return 'Februari';
    else if (value == 3) return 'Maret';
    else if (value == 4) return 'April';
    else if (value == 5) return 'Mei';
    else if (value == 6) return 'Juni';
    else if (value == 7) return 'Juli';
    else if (value == 8) return 'Agustus';
    else if (value == 9) return 'September';
    else if (value == 10) return 'Oktober';
    else if (value == 11) return 'November';
    else if (value == 12) return 'Desember';
  }

  static String getEnglishMonth(int value) {
    if (value == 1) return 'January';
    else if (value == 2) return 'February';
    else if (value == 3) return 'March';
    else if (value == 4) return 'April';
    else if (value == 5) return 'May';
    else if (value == 6) return 'June';
    else if (value == 7) return 'July';
    else if (value == 8) return 'August';
    else if (value == 9) return 'September';
    else if (value == 10) return 'October';
    else if (value == 11) return 'November';
    else if (value == 12) return 'December';
  }
}
