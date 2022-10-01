Future<void> delay(bool addDelay, [int millisecond = 200]) {
  if (addDelay) {
    return Future.delayed(Duration(milliseconds: millisecond));
  } else {
    return Future.value();
  }
}
