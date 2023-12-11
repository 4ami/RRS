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
  String get message => exception;
  const FailedGETTablesState({required this.exception});
}

/// * [NewReservationState] => all states related to create new reservation
class InitialNewReservationState extends TableReservationState {
  @override
  String get message => 'Initial state to create new reservation';
  const InitialNewReservationState();
}

class TriggerNewReservationState extends TableReservationState {
  @override
  String get message => "POST request triggered";
  const TriggerNewReservationState();
}

class SuccessfulNewReservationState extends TableReservationState {
  @override
  String get message => "Reserved table successfully";
  const SuccessfulNewReservationState();
}

class FaildNewReservationState extends TableReservationState {
  final String exception;
  @override
  String get message => exception;

  const FaildNewReservationState({required this.exception});
}

/// * [CurrentReservationState] => all states related to get current reservation

class InitialGetReservation extends TableReservationState {
  @override
  String get message => 'Initial state to get reservation';
  const InitialGetReservation();
}

class TriggerGETReservationState extends TableReservationState {
  @override
  String get message => 'Trigger state to get reservation';
  const TriggerGETReservationState();
}

class SuccessfulGETReservationState extends TableReservationState {
  @override
  String get message => 'GET reservation Ok!';
  const SuccessfulGETReservationState();
}

class FaildGETReservationState extends TableReservationState {
  final String exception;
  @override
  String get message => exception;
  const FaildGETReservationState({required this.exception});
}

/// * [DeleteReservationState] => all states related to get current reservation

class InitialDeleteReservation extends TableReservationState {
  @override
  String get message => 'Initial state to delete reservation';
  const InitialDeleteReservation();
}

class TriggerDeleteReservation extends TableReservationState {
  @override
  String get message => 'Trigger state to delete reservation';
  const TriggerDeleteReservation();
}

class SuccessDeleteReservation extends TableReservationState {
  @override
  String get message => 'Delete reservation successfully';
  const SuccessDeleteReservation();
}

class FailedDeleteReservation extends TableReservationState {
  final String exception;
  @override
  String get message => exception;
  const FailedDeleteReservation({required this.exception});
}

/// * [UpdateState] => all states related to get current reservation

class  InitialUpdateState extends TableReservationState {
  @override
  String get message => 'Initial state to update reservation';
  const InitialUpdateState();
}

class TriggerUpdateState extends TableReservationState {
  @override
  String get message => 'Trigger state to update reservation';
  const TriggerUpdateState();
}

class FieldUpdateState extends TableReservationState {
  final String exception;
  @override
  String get message => exception;
  const FieldUpdateState({required this.exception});
}

class SuccessUpdateState extends TableReservationState {
  @override
  String get message => 'update reservation successfully';
  const SuccessUpdateState();
}