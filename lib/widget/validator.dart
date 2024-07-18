class AuthValidate {
  AuthValidate();

  validateEmail(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter email';
    }
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    final bool isValidEmail = regExp.hasMatch(value!);
    if (!isValidEmail) {
      return "Please enter a valid email";
    }
    return null;
  }

  validatePassword(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'Use at least than 6 characters';
    } else if (!RegExp(".*[0-9].*").hasMatch(value)) {
      return 'Input should contain a numeric value 1-9';
    }
    if (!RegExp('.*[a-z].*').hasMatch(value)) {
      return 'Input should contain a lowercase letter a-z';
    } else if (!RegExp('.*[A-Z].*').hasMatch(value)) {
      return 'Input should contain an uppercase letter A-Z';
    } else if (!RegExp(r'.*[!@#$%^&*(),.?":{}|_<>=+~\[\]\\/].*')
        .hasMatch(value)) {
      return 'Input should contain a special character';
    }
    return null;
  }

  validateConfirmPassword(
      {required String password, required String confirmPassword}) {
    if (confirmPassword.trim().isEmpty) {
      return 'Please confirm password';
    } else if (password != confirmPassword) {
      return 'Password does not match';
    }
    return null;
  }

  validatePhoneNumber(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter phone number';
    } else if (value.length < 10 || value.length > 10) {
      return 'Number should be 10 digits';
    } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value.trim())) {
      return 'Field should contain only numbers';
    } else if (value[0] != '0') {
      return 'Number should begin with 0';
    } else if (value[1] == '0') {
      return 'Enter a valid phone number';
    }
    return null;
  }

  validateSecondNumber(value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    if (value[0] == "+") {
      if (value.length < 13 || value.length > 13) {
        return 'Number should be 13 digits';
      } else if (!RegExp(r'^(\+\d{1,3}[- ]?)?\d{10}$').hasMatch(value.trim())) {
        return 'Field should contain only numbers';
      }
    } else {
      if (value.length < 10 || value.length > 10) {
        return 'Number should be 10 digits';
      } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
          .hasMatch(value.trim())) {
        return 'Field should contain only numbers';
      } else if (value[0] != '0') {
        return 'Number should begin with 0';
      }
    }
    return null;
  }

  validateFullName(value) {
    // String  _value = value.replace(\s\s+/g, ' ');
    if (value == null || value.trim().isEmpty) {
      return 'Please enter full name';
    } else if (value.length <= 4) {
      return 'Name should be at least 4 characters';
    } else if (value.length > 50) {
      return 'Name should be at most 50 characters';
    } else if (!RegExp(
            r"^[a-zA-Z]([-]?[a-zA-Z]+)*( {1,2}[a-zA-Z]([-]?[a-zA-Z]+)*)+$")
        .hasMatch(value.trim())) {
      return ("Please enter a valid name");
    } else if (value.startsWith('-') || value.endsWith('-')) {
      return ("Name cannot begin or end with hyphen");
    } else if (RegExp(r'.*[!@#$%^&*(),.?":{}|_<>=+~\[\]\\/].*')
        .hasMatch(value)) {
      return 'Full name should not contain special characters';
    }
    return null;
  }

  validateSchool(value) {
    // String  _value = value.replace(\s\s+/g, ' ');
    if (value == null || value.trim().isEmpty) {
      return 'Please select school';
    } else if (value.length <= 4) {
      return 'School should be at least 4 characters';
    } else if (value.length > 50) {
      return 'School should be at most 50 characters';
    } else if (value.startsWith('-') || value.endsWith('-')) {
      return ("School cannot begin or end with hyphen");
    }
    return null;
  }

  validateHall(value) {
    // String  _value = value.replace(\s\s+/g, ' ');
    if (value == null || value.trim().isEmpty) {
      return 'Please select Hall';
    } else if (value.length <= 4) {
      return 'Hall should be at least 4 characters';
    } else if (value.length > 50) {
      return 'Hall should be at most 50 characters';
    } else if (value.startsWith('-') || value.endsWith('-')) {
      return ("Hall cannot begin or end with hyphen");
    }
    return null;
  }

  validateusername(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter username';
    } else if (value.length < 4 || value.length > 20) {
      return 'Name should between 4 to 20 characters';
    } else if (!RegExp(r'^[a-zA-Z0-9_]{1,20}$').hasMatch(value.trim())) {
      return ("Please enter a valid name");
    } else if (value.startsWith('-') || value.endsWith('-')) {
      return ("Name cannot begin or end with hyphen");
    }
    return null;
  }

  validateEmailUsername(value) {
    if (value!.trim().isEmpty) {
      return "Please enter email / username";
    } else if (value.toString().contains('@')) {
      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[.][a-z]")
          .hasMatch(value.trim())) {
        return ("Please enter a valid email");
      }
    } else {
      if (value.length <= 4) {
        return 'Username should be at least 4 characters';
      } else if (!RegExp(r'^[a-zA-Z0-9_]{1,20}$').hasMatch(value.trim())) {
        return ("Please enter a valid username");
      } else if (value.startsWith('-') || value.endsWith('-')) {
        return ("Username cannot begin or end with hyphen");
      }
    }
    return null;
  }

  validateLoginPassword(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter password';
    }
    return null;
  }

  validateOTP(value) {
    if (value!.isNotEmpty && int.tryParse(value) == null) {
      return 'OTP should contain only numbers';
    }
    return null;
  }

  validateNotEmpty(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field should not be empty';
    }
    return null;
  }

  validateCity(value) {
    if (value != null && value.trim().isNotEmpty) {
      if (!(RegExp(r'^[a-zA-Z0-9_ ]{1,30}$').hasMatch(value.trim()))) {
        return 'Enter a valid city';
      }
    }
    return null;
  }

  validatePlusPhoneNmmber(value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    if (value[0] == "+") {
      if (value.length < 13 || value.length > 13) {
        return 'Number should be 13 digits';
      } else if (!RegExp(r'^(\+\d{1,3}[- ]?)?\d{10}$').hasMatch(value.trim())) {
        return 'Field should contain only numbers';
      }
    } else {
      if (value.length < 10 || value.length > 10) {
        return 'Number should be 10 digits';
      } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
          .hasMatch(value.trim())) {
        return 'Field should contain only numbers';
      } else if (value[0] != '0') {
        return 'Number should begin with 0';
      }
    }
    return null;
  }

  validateTwitterHandle(value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[.][a-z]")
        .hasMatch(value.trim())) {
      return ("Please enter a valid input");
    }
    return null;
  }
}
