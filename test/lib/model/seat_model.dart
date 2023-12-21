class SeatModel {
  Venue? venue;
  SeatLayout? seatLayout;

  SeatModel({this.venue, this.seatLayout});

  SeatModel.fromJson(Map<String, dynamic> json) {
    venue = json['venue'] != null ? new Venue.fromJson(json['venue']) : null;
    seatLayout = json['seatLayout'] != null
        ? new SeatLayout.fromJson(json['seatLayout'])
        : null;
  }
}

class Venue {
  String? name;
  int? capacity;

  Venue({this.name, this.capacity});

  Venue.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    capacity = json['capacity'];
  }
}

class SeatLayout {
  int? rows;
  int? columns;
  List<Seats>? seats;

  SeatLayout({this.rows, this.columns, this.seats});

  SeatLayout.fromJson(Map<String, dynamic> json) {
    rows = json['rows'];
    columns = json['columns'];
    if (json['seats'] != null) {
      seats = <Seats>[];
      json['seats'].forEach((v) {
        seats!.add(new Seats.fromJson(v));
      });
    }
  }
}

class Seats {
  String? seatNumber;
  String? status;

  Seats({this.seatNumber, this.status});

  Seats.fromJson(Map<String, dynamic> json) {
    seatNumber = json['seatNumber'];
    status = json['status'];
  }
}