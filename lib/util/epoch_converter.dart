import 'package:intl/intl.dart';

class EpochConverter {

  static String convertToDate(int millisecondsSinceEpoch) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch, isUtc: true);
    return DateFormat('E, MMM M').format(dateTime);
  }

  static String convertToTime(int millisecondsSinceEpoch) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch, isUtc: true);
    String time = DateFormat('jm').format(dateTime);
    String hour = time.substring(0, time.indexOf(':'));
    return hour.length == 1 ? '0$time' : time;
  }

  static String convertToWeekday(int millisecondsSinceEpoch) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch, isUtc: true);
    return DateFormat('E').format(dateTime);
  }
}