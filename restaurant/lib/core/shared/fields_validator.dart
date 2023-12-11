class Validators {
  static final RegExp _sqlI = RegExp(
      r'(\bSELECT\b|\bINSERT\b|\bUPDATE\b|\bDELETE\b|\bFROM\b|\bWHERE\b|\bDROP\b|\bALTER\b|\bCREATE\b|\bUNION\b|\bAND\b|\bOR\b|\bLIKE\b|\b%27\b|\b;\b)',
      caseSensitive: false);

  static final RegExp _phone = RegExp(r'^\d+$');
  static final RegExp _emailReg = RegExp(
      r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required Field';
    }

    if (_sqlI.hasMatch(value)) {
      return 'Invalid entry';
    }

    if (value[0] != '5') {
      return 'Phone must start with \'5\'';
    }

    if (value.length < 9) {
      return 'Phone must be 9 digits';
    }

    if (!_phone.hasMatch(value)) {
      return 'Invalid Phone number';
    }
    return null;
  }

  static String? partySizeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required Field';
    }

    if (_sqlI.hasMatch(value)) {
      return 'Invalid entry';
    }

    if (int.tryParse(value) == null) {
      return 'Invalid entry';
    }

    return null;
  }

  static String? reservationIdValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required Field';
    }

    if (_sqlI.hasMatch(value)) {
      return 'Invalid entry';
    }

    return null;
  }

  static String? usernameValidator(String? name) {
    if (name == null) {
      return 'Required field';
    }

    if (name.isEmpty) {
      return 'Required field';
    }

    if (_sqlI.hasMatch(name)) {
      return 'Invalid Username';
    }

    return null;
  }

  static String? emailValidator(String? email) {
    if (email == null) {
      return '';
    }

    if (email.isEmpty) {
      return '';
    }

    if (_sqlI.hasMatch(email)) {
      return 'Invalid Email';
    }

    if (!_emailReg.hasMatch(email)) {
      return '';
    }

    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null) {
      return 'Required Field';
    }

    if (password.isEmpty) {
      return 'Required Field';
    }

    if (_sqlI.hasMatch(password)) {
      return 'Invalid Password';
    }
    return null;
  }

  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '';
    }

    if (_sqlI.hasMatch(value)) {
      return '';
    }

    if (value.length < 6) {
      return '';
    }
    return null;
  }
}
