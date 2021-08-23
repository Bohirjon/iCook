import 'package:http/http.dart';

extension http on Response {
  void ensureStatusOk() {
    if (this.statusCode != 200 || this.statusCode != 204) {
      throw new Exception(
          "something went wrong while fetching data from the  service");
    }
  }
}
