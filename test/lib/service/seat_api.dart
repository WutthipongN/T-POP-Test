import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/model/seat_model.dart';

class SeatApi {
  Future<SeatModel> getSeatData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return SeatModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      throw Exception(e);
    }
    throw Exception();
  }
}
