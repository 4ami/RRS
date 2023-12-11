import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/data/repositories/delete_reservation_repo.dart';
import 'package:restaurant/view/home/bloc/table_reservation/delete_reservation/delet_reservation_state.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_event.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class DeleteReservationBloc extends Bloc<TableEvents, DeleteReservationState> {
  DeleteReservationBloc({required this.deleteRepo})
      : super(const DeleteReservationState()) {
    on<DeleteReservationEvent>((event, emit) async {
      emit(state.copyWith(state: const TriggerDeleteReservation()));
      try {
        String response = await deleteRepo.deleteReservation(event.id);
        emit(state.copyWith(
            response: response, state: const SuccessDeleteReservation()));
      } catch (error) {
        emit(
          state.copyWith(
            state: FailedDeleteReservation(exception: error as String),
          ),
        );
      }
    });
  }

  final DeleteReservationRepo deleteRepo;
}
