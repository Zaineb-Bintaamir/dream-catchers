import 'package:intl/intl.dart';

class DateHandlers {
  static String formatDate(DateTime date) {
    return DateFormat('MMMM dd, yyyy').format(date);
  }
}
