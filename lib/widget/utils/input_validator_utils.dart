class InputValidatorUtils {
  static bool isEmailAddressValid(String email) {
    final regex = RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    );
    return regex.hasMatch(email);
  }

  static bool isInputValid(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  static String? validEmailAddress(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }

    if (isEmailAddressValid(email.trim())) {
      return null;
    }
    return 'Invalid email address';
  }

  static String? nonEmptyField(String label, String? value) {
    return isInputValid(value) ? null : '$label is required';
  }

  static String? confirmPassword(String password1, String password2) {
    if (password1 == password2) {
      return null;
    }

    return 'Passwords do not match';
  }

  static String? isUsernameValid(String? username) {
    /*
    Usernames must contain between 6 and 24 characters and may consist of letters, numbers, dashes and underscores. 
    The first three characters must be letters.
    */
    final regex = RegExp(r'^[a-zA-Z]{3}[a-zA-Z0-9_-]{3,21}$');

    if (username == null || username.trim().isEmpty) {
      return 'Username is required';
    }

    final isUsernameValid = regex.hasMatch(username);
    if (!isUsernameValid) {
      return 'Invalid username.';
    }

    return null;
  }

  static validateNotEmpty(value, String errorText) {
    if (value == null || value.trim().isEmpty) {
      return errorText;
    }
    return null;
  }
}
