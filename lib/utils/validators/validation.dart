class MValidator {
  static String? validateEmptyText(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for Indian phone numbers (10 digits, starting with 6-9)
    final phoneRegExp = RegExp(r'^[6-9]\d{9}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (should be 10 digits, starting with 6-9).';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Only check for minimum length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    return null; // ✅ No other restrictions
  }
}
