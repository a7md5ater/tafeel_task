class ValidationHelper {
  static bool isValidEmail({required String email}) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isValidPhoneNumber({required String phoneNumber}) {
    final regex = RegExp(r'^(?:\+?\d{1,3})?[ -]?\d{10,12}$');
    return regex.hasMatch(phoneNumber.replaceAll(' ', ''));
  }
}
