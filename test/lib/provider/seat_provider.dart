import 'package:flutter/foundation.dart';
import 'package:test/model/seat_model.dart';
import 'package:test/service/seat_api.dart';

enum LoadStatus { loading, complete, fail }

class SeatProvider with ChangeNotifier {
  LoadStatus? loadStatus = LoadStatus.loading;
  final String baseURL =
      'https://storage.googleapis.com/tpop-app-dev.appspot.com/test/seating.json';

  SeatModel _seat = SeatModel();
  SeatModel get seat => _seat;

  SeatApi seatApi = SeatApi();

  int indexSeat = 0;

  Future<void> getSeat() async {
    try {
      _seat = await seatApi.getSeatData(baseURL);
      loadStatus = LoadStatus.complete;
      notifyListeners();
    } catch (e) {
      loadStatus = LoadStatus.fail;
      notifyListeners();
      throw Exception('Failed to fetch data: $e');
    }
  }

  final List<Seats> _select = [];
  List<Seats> get select => _select;

  void selectSeat(int index) {
    select.add(seat.seatLayout!.seats![index]);
    seat.seatLayout!.seats![index].status = 'booking';
    notifyListeners();
  }

  Future<void> unselectSeat(int index) async {
    await findIndex(index);
    seat.seatLayout!.seats![indexSeat].status = 'available';
    select.removeAt(index);
    notifyListeners();
  }

  Future<void> findIndex(int index) async {
    indexSeat = seat.seatLayout!.seats!.indexWhere(
        (element) => element.seatNumber == select[index].seatNumber);
  }

  SeatProvider() {
    getSeat();
  }
}
