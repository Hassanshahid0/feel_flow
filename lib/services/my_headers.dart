class MyHeaders {
  static Map<String, String> header() {
    return {
      'Content-type': 'application/json',
    };
  }

  static Map<String, String> headerMedia() {
    return {
      'Content-type': 'multipart/form-data',
    };
  }
}
