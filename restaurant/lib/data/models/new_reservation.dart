class NewReservation {
  final String customerPhone;
  final String tableId;
  final int parySize;
  final String reservationDate;

  const NewReservation(
      {required this.customerPhone,
      required this.tableId,
      required this.parySize,
      required this.reservationDate});

  factory NewReservation.fromJson(Map<String, dynamic> reservation) {
    return NewReservation(
        customerPhone: reservation["customer_phone"],
        tableId: reservation["table_id"],
        parySize: (reservation["party_size"]).toInt(),
        reservationDate: reservation["reservation_date"]);
  }
}
