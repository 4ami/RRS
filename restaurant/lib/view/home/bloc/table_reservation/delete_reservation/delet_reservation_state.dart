import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class DeleteReservationState {
  final String response;
  final TableReservationState state;
  const DeleteReservationState(
      {this.response = '', this.state = const InitialDeleteReservation()});

  DeleteReservationState copyWith(
          {String? response, TableReservationState? state}) =>
      DeleteReservationState(
        response: response ?? this.response,
        state: state ?? this.state,
      );
}
