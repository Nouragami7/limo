class Validators {
  static String? username(String? v) {
    final s = v?.trim() ?? '';
    if (s.isEmpty) return 'Username is required';
    if (s.length < 3) return 'Username must be at least 3 characters';
    return null;
  }

  static String? email(String? v) {
    final s = v?.trim() ?? '';
    if (s.isEmpty) return 'Email is required';

    final emailRegex =
    RegExp(r'^[\w\.\-]+@[\w\.\-]+\.\w+$');

    if (!emailRegex.hasMatch(s)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? password(String? v) {
    final s = v ?? '';
    if (s.isEmpty) return 'Password is required';
    if (s.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  static String? confirmPassword(String? v, String password) {
    final s = v ?? '';
    if (s.isEmpty) return 'Please confirm your password';
    if (s != password) return 'Passwords do not match';
    return null;
  }
}
