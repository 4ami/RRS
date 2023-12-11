import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/data/models/reservation_detail.dart';
import 'package:restaurant/view/home/bloc/table_reservation/delete_reservation/delete_reservation_bloc.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_event.dart';

class ReservationInformation extends StatelessWidget {
  const ReservationInformation({super.key, required this.detail});
  final ReservationDetail detail;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xffFFF2F2),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(-2, 6),
              blurRadius: 16,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text.rich(
                TextSpan(
                  text: "Reservation Status: ",
                  children: [
                    TextSpan(
                      text: detail.reservationStatus,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: detail.reservationStatus == "Confirmed"
                              ? Colors.green
                              : detail.reservationStatus == "Rejected"
                                  ? Colors.redAccent
                                  : Colors.amber),
                    ),
                  ],
                ),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Text.rich(
              TextSpan(
                text: "Table Number: ",
                children: [
                  TextSpan(
                    text: detail.table.tableNumber.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            ),
            Text.rich(
              TextSpan(
                text: "Party Size: ",
                children: [
                  TextSpan(
                    text: detail.reservation.parySize.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 50),
            Text.rich(
              TextSpan(
                text: "Reservation Date and Time:\n",
                children: [
                  TextSpan(
                    text: detail.reservation.reservationDate.substring(0, 10),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextSpan(
                    text:
                        " ${detail.reservation.reservationDate.substring(11, 16)}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 50,
              child: FilledButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xff1A5F7A)),
                ),
                child: Text(
                  "Modify Reservation",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                onPressed: () => context.push('/modify-reservation', extra: detail),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 50,
              child: FilledButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                ),
                child: Text(
                  "Delete Reservation",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                onPressed: () {
                  context
                      .read<DeleteReservationBloc>()
                      .add(DeleteReservationEvent(id: detail.id));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
