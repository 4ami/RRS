import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/data/repositories/update_repo.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_event.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';
import 'package:restaurant/view/home/bloc/table_reservation/update_reservation/update_state.dart';

class UpdateReservationBloc extends Bloc<TableEvents, UpdateReservationState> {
  UpdateReservationBloc({required this.updateRepo})
      : super(const UpdateReservationState()) {
    on<UpdateReservationEvent>((event, emit) async {
      emit(state.copyWith(state: const TriggerUpdateState()));
      try {
        await updateRepo.updateReservation(
            event.id, event.phone, event.dateTime, event.partySize);

        emit(state.copyWith(state: const SuccessUpdateState()));
      } catch (error) {
        emit(
          state.copyWith(
            state: FieldUpdateState(exception: error as String),
          ),
        );
      }
    });
  }

  final UpdateReservationRepo updateRepo;
}
