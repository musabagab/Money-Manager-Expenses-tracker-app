import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesService {
  final String hourKey = 'hour';
  final String minuteKey = 'minute';

  Future<String> getTime() async {
    final prefs = await SharedPreferences.getInstance();

    // Try reading data from the counter key. If it doesn't exist, return 0.
    final int hour = prefs.getInt(hourKey) ?? 0;
    final int minute = prefs.getInt(minuteKey) ?? 0;

    if (hour == 0 || minute == 0) return 'Time not specfied';
    // make the hour two digit because its 24 HR view
    String hourTwoDigits = hour.toString().padLeft(2, '0');

    return 'Reminder at $hourTwoDigits:$minute';
  }

  storeTime(int hour, int minute) async {
    // obtain shared preferences
    final prefs = await SharedPreferences.getInstance();

    // set value
    prefs.setInt(hourKey, hour);
    prefs.setInt(minuteKey, minute);
  }
}
