import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class NewReservationState {
  final String reservationId;
  final String phone;
  final String dateTime;
  final String tableId;
  final int partySize;
  final TableReservationState reservationState;
  const NewReservationState({
    this.phone = '',
    this.dateTime = '',
    this.reservationId = '',
    this.partySize = 0,
    this.tableId = '',
    this.reservationState = const InitialNewReservationState(),
  });

  NewReservationState copyWith(
          {String? id,
          String? phone,
          String? dateTime,
          String? tableId,
          int? partySize,
          TableReservationState? state}) =>
      NewReservationState(
        reservationId: id ?? reservationId,
        reservationState: state ?? reservationState,
        phone: phone ?? this.phone,
        dateTime: dateTime ?? this.dateTime,
        tableId: tableId ?? this.tableId,
        partySize: partySize ?? this.partySize,
      );
}
