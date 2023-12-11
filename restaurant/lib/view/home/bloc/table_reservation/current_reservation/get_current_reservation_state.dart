import 'package:restaurant/data/models/reservation_detail.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class GetReservationInfo {
  final ReservationDetail? detail;
  final TableReservationState state;
  final String id;

  const GetReservationInfo(
      {this.detail, this.state = const InitialGetReservation(), this.id = ''});

  GetReservationInfo copyWith(
          {ReservationDetail? detail,
          TableReservationState? state,
          String? id}) =>
      GetReservationInfo(
          detail: detail ?? this.detail,
          state: state ?? this.state,
          id: id ?? this.id);
}
