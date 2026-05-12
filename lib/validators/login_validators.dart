//task 2
String? validateEmail(String? value) {
  // Check if email is null or empty
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
}

  // Simple email regex pattern
  final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  if (!emailRegex.hasMatch(value.trim())) {
    return 'Invalid email';
  }

  //valid email
  return null;

}

String? validatePassword(String? value) {
  // Check if password is null or empty
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  // Check if password is at most 8 characters long
  if (value.length > 8) {
    return 'Password must be at most 8 characters';
  }

  return null;
}

