import 'package:restaurant/data/models/table.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class GetTablesState {
  final List<Tables> tables;
  final TableReservationState tableState;
  const GetTablesState({
    this.tables = const [],
    this.tableState = const InitialGetTablesState(),
  });

  GetTablesState copyWith(
          {List<Tables>? tables, TableReservationState? state}) =>
      GetTablesState(
        tables: tables ?? this.tables,
        tableState: state ?? tableState,
      );
}
