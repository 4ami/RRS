import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/data/models/table.dart';
import 'package:restaurant/data/repositories/table_reservation_repository.dart';
import 'package:restaurant/view/home/bloc/table_reservation/get_tables_state.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_event.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class GetTablesBloc extends Bloc<TableEvents, GetTablesState> {
  GetTablesBloc({required this.tableRepo}) : super(const GetTablesState()) {
    on<GetTablesData>(
      (event, emit) async {
        emit(state.copyWith(state: const TriggerGETTablesState()));
        try {
          List<Tables> tables = await tableRepo.getTables();
          emit(state.copyWith(tables: tables));
          emit(state.copyWith(state: const SuccessfulGETTablesState()));
        } catch (error) {
          emit(
            state.copyWith(
              state: FailedGETTablesState(exception: error as String),
            ),
          );
        }
      },
    );
  }

  final GetTables tableRepo;
}
