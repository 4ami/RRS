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
}
