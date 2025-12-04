class Validators {
  static String? firstName(String? v) {
    final s = v?.trim() ?? '';
    if (s.isEmpty) return 'Please fill your first name';
    if (s.length < 2) return 'First name is too short';
    return null;
  }

  static String? lastName(String? v) {
    final s = v?.trim() ?? '';
    if (s.isEmpty) return 'Please fill your last name';
    if (s.length < 2) return 'Last name is too short';
    return null;
  }

  static String? phone(String? v) {
    if (v == null || v.trim().isEmpty) {
      return 'Please fill your phone number';
    }

    final s = v.replaceAll(RegExp(r'[\s\+]'), '');

    if (!RegExp(r'^[0-9]{7,15}$').hasMatch(s)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? email(String? v) {
    final s = v?.trim() ?? '';
    if (s.isEmpty) return 'Please fill your email';
    final ok = RegExp(r'^[\w\.\-]+@[\w\.\-]+\.\w+$').hasMatch(s);
    if (!ok) return 'Enter a valid email';
    return null;
  }

  static String? password(String? v) {
    final s = v ?? '';
    if (s.isEmpty) return 'Please fill your password';
    if (s.length < 6) return 'Minimum 6 characters';
    return null;
  }

  static String? confirmPassword(String? v, String original) {
    if ((v ?? '').isEmpty) return 'Please confirm your password';
    if (v != original) return "Your password doesn't match";
    return null;
  }

}
