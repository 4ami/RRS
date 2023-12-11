import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/data/models/reservation_detail.dart';
import 'package:restaurant/data/repositories/table_reservation_repository.dart';
import 'package:restaurant/view/home/bloc/table_reservation/current_reservation/get_current_reservation_state.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_event.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class GetReservationData extends Bloc<TableEvents, GetReservationInfo> {
  GetReservationData({required this.getReservationRepo})
      : super(const GetReservationInfo()) {
    on<ReservationIDChange>(
        (event, emit) => emit(state.copyWith(id: event.id)));

    on<ReservationInfo>(
      (event, emit) async {
        emit(state.copyWith(state: const TriggerGETReservationState()));
        try {
          ReservationDetail detail =
              await getReservationRepo.getReservationDetail(state.id);
          emit(
            state.copyWith(detail: detail),
          );
          emit(state.copyWith(state: const SuccessfulGETReservationState()));
        } catch (error) {
          emit(state.copyWith(
              state: FaildGETReservationState(exception: error as String)));
        }
      },
    );
  }

  final GetReservationRepo getReservationRepo;
}
