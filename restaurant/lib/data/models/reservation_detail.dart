import 'package:restaurant/data/models/new_reservation.dart';
import 'package:restaurant/data/models/table.dart';

class ReservationDetail {
  final Tables table;
  final NewReservation reservation;

  const ReservationDetail({
    required this.table,
    required this.reservation,
  });
}
