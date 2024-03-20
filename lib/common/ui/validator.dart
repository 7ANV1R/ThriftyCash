String? emailValidator(value) {
  if (value == null ||
      value.isEmpty ||
      !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
    return 'Please provide a valid email';
  }
  return null;
}

String? passwordValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? emptyValidator(value, [String? fieldName]) {
  if (value == null || value.isEmpty) {
    return fieldName != null ? '$fieldName cannot be empty' : 'This Field cannot be empty';
  }
  return null;
}
