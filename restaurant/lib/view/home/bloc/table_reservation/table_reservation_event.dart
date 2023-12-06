abstract class TableEvents {}


/// * [Return] * [All] * [Restaurant] * [Tables]
class GetTablesData extends TableEvents {}

/// * [New] * [Reservation]
class ReserveTable extends TableEvents {}

/// * [Return] * [Reservation] * [Information]
class ReservationInfo extends TableEvents {}
