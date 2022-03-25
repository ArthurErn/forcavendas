extension StringExtension on String {
  String inverseDate() {
    //"2022-03-25"
    var dateList = [];
    try {
      dateList = [
        this[8],
        this[9],
        "-",
        this[5],
        this[6],
        "-",
        this[0],
        this[1],
        this[2],
        this[3]
      ];
      return dateList.join("");
    } on Exception catch (_) {
      return "01-01-0001";
    }
  }
}
