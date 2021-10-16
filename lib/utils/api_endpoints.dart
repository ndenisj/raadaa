class ApiEndPoints {
  ApiEndPoints._();

  static String getAPI(String endpoint) {
    return 'https://jsonplaceholder.typicode.com/$endpoint';
  }
}
