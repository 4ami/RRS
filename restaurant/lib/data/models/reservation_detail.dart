import 'package:restaurant/data/models/new_reservation.dart';
import 'package:restaurant/data/models/table.dart';

class ReservationDetail {
  final Tables table;
  final NewReservation reservation;
  final String reservationStatus;
  final String id;

  const ReservationDetail(
      {required this.table,
      required this.reservation,
      required this.reservationStatus, required this.id});
}
