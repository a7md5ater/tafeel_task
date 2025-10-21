class DateHelper {
  static String formattedDate({required DateTime? dateTime}) {
    if (dateTime == null) return '';
    return '${dateTime.day.toString().padLeft(2, '0')}/'
        '${dateTime.month.toString().padLeft(2, '0')}/'
        '${dateTime.year}';
  }
}
