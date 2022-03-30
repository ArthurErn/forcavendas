import 'package:intl/intl.dart';

extension StringExtension on String {
  String toCurrency() {
    var valueFormat = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
    var text = valueFormat.format(double.parse(this));
    return text;
  }
}
