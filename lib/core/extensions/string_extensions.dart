extension StringValidation on String {
  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  bool get isValidOtp => RegExp(r"^[0-9]{6}$").hasMatch(this);
}
