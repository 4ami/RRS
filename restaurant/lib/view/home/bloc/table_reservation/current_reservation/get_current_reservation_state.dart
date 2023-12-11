import 'package:restaurant/data/models/new_reservation.dart';
import 'package:restaurant/data/models/table.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class GetReservationInfo {
  final Tables? table;
  final NewReservation? reservation;
  final String reservationStatus;
  final TableReservationState state;

  const GetReservationInfo(
      {this.table,
      this.reservation,
      this.reservationStatus = '',
      this.state = const InitialGetReservation()});

  GetReservationInfo copyWith(
          {String? status,
          Tables? table,
          NewReservation? reservation,
          TableReservationState? state}) =>
      GetReservationInfo(
        table: table ?? this.table,
        reservation: reservation ?? this.reservation,
        reservationStatus: status ?? reservationStatus,
        state: state ?? this.state,
      );
}
