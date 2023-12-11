import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/business/repositories/table_reservation_repository.dart';
import 'package:restaurant/data/models/new_reservation.dart';
import 'package:restaurant/view/home/bloc/table_reservation/new_reservation/reserve_table_state.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_event.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class NewReservationBloc extends Bloc<TableEvents, NewReservationState> {
  NewReservationBloc({required this.reservationRepo})
      : super(const NewReservationState()) {
    on<CustomerPhoneChange>(
        (event, emit) => emit(state.copyWith(phone: event.phone)));

    on<CustomerDateAndTimeChange>(
        (event, emit) => emit(state.copyWith(dateTime: event.dateTime)));

    on<CustomerTableIDChange>(
        (event, emit) => emit(state.copyWith(tableId: event.tableId)));

    on<CustomerPartySizeChange>(
        (event, emit) => emit(state.copyWith(partySize: event.partySize)));

    on<ReserveTable>(
      (event, emit) async {
        emit(state.copyWith(state: const TriggerNewReservationState()));
        try {
          NewReservation reservation = NewReservation(
            customerPhone: state.phone,
            tableId: state.tableId,
            parySize: state.partySize,
            reservationDate: state.dateTime,
          );
          String id = await reservationRepo.reserveTable(reservation);
          emit(state.copyWith(id: id));
          emit(state.copyWith(state: const SuccessfulNewReservationState()));
        } catch (error) {
          emit(
            state.copyWith(
              state: FaildNewReservationState(exception: error as String),
            ),
          );
        }
      },
    );
  }

  final CreateReservation reservationRepo;
}
