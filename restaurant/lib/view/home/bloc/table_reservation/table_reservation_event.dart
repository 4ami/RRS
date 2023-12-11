abstract class TableEvents {}

/// * [Return] * [All] * [Restaurant] * [Tables]
class GetTablesData extends TableEvents {}

/// * [New] * [Reservation]
class ReserveTable extends TableEvents {}

class CustomerPhoneChange extends TableEvents {
  final String phone;
  CustomerPhoneChange({required this.phone});
}

class CustomerDateAndTimeChange extends TableEvents {
  final String dateTime;
  CustomerDateAndTimeChange({required this.dateTime});
}

class CustomerTableIDChange extends TableEvents {
  final String tableId;
  CustomerTableIDChange({required this.tableId});
}

class CustomerPartySizeChange extends TableEvents {
  final int partySize;
  CustomerPartySizeChange({required this.partySize});
}

/// * [Return] * [Reservation] * [Information]
class ReservationInfo extends TableEvents {}

class ReservationIDChange extends TableEvents {
  final String id;
  ReservationIDChange({required this.id});
}

/// * [Delete] * [Reservation] * [Information]

class DeleteReservationEvent extends TableEvents {
  final String id;
  DeleteReservationEvent({required this.id});
}

/// * [Update] * [Reservation] * [Information]

class UpdateReservationEvent extends TableEvents {
  final String id;
  final String dateTime;
  final String phone;
  final int partySize;
  UpdateReservationEvent(
      {required this.id, required this.dateTime, required this.phone, required this.partySize});
}
