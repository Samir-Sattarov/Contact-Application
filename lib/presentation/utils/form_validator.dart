class FormValidator {
  static String? empty(value) {
    if (value == null || value.isEmpty) {
      return 'Please Fill In The Fields';
    }
    return null;
  }

  static String? validateEmail(value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value ?? '');
    if (value == null || value.isEmpty || !emailValid) {
      return 'Please Enter Email';
    }
    return null;
  }

  static String? validatorName(value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Your Name';
    }
    return null;
  }

  static String? validatorPhone(value) {
    bool phoneValid = RegExp("[0-9] +").hasMatch(value ?? '');
    if (value == null || value.isEmpty || !phoneValid) {
      return 'Please Enter Email';
    }
    return null;
  }

  static String? validatorPassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Password';
    }
    return null;
  }

  static String? validatorValidationCode(value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Code Number';
    }
    return null;
  }
  // static String? passwordConfirm(value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Required';
  //   }

  //   if (value) {
  //     return "Password Mis match";
  //   }

  //   return null;
  // }
}
