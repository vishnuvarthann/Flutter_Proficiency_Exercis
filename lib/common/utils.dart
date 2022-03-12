import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

class Utils {
  static String convertTimeStampToDate(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('MMM dd,yyyy hh:mm a').format(date);
  }

  static Future<bool> isInternetAvailable() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
