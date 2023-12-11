import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class UpdateReservationState {
  final TableReservationState state;
  const UpdateReservationState({this.state = const InitialUpdateState()});

  UpdateReservationState copyWith({TableReservationState? state}) =>
      UpdateReservationState(
        state: state ?? this.state,
      );
}
