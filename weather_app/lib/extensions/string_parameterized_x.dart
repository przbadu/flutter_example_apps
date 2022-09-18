extension StringParsing on String {
  /// convert string to parameterized
  /// e.g: "abc xyz PQR".parameterized will return "abc-xyz-pqr"
  String parameterized() {
    return toLowerCase().split(' ').join('-');
  }
}
