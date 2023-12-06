class Tables {
  final String id;
  final int tableNumber;
  final String location;
  final String availability;

  const Tables(
      {required this.id,
      required this.tableNumber,
      required this.location,
      required this.availability});

  factory Tables.fromJson(Map<String, dynamic> tables) {
    return Tables(
      id: tables['id'],
      tableNumber: (tables['table_number']).toInt(),
      location: tables['location'],
      availability: tables['availability'],
    );
  }
}
