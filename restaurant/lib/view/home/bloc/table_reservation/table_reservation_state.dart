abstract class TableReservationState {
  String get message;
  const TableReservationState();
}

/// * [GETTableDateStates] => All states related to get tables data from back-end
class InitialGetTablesState extends TableReservationState {
  @override
  String get message => 'Wating to action';
  const InitialGetTablesState();
}

class TriggerGETTablesState extends TableReservationState {
  @override
  String get message => 'Sending GET request';
  const TriggerGETTablesState();
}

class SuccessfulGETTablesState extends TableReservationState {
  @override
  String get message => 'Fetching Tables Date Success!';
  const SuccessfulGETTablesState();
}

class FailedGETTablesState extends TableReservationState {
  final String exception;
  @override
  String get message => exception.toString();
  const FailedGETTablesState({required this.exception});
}
