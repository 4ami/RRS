import 'package:flutter/material.dart';
import 'package:restaurant/data/models/reservation_detail.dart';

class ReservationInformation extends StatelessWidget {
  const ReservationInformation({
    super.key,
    required this.detail
  });
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
                      text: "Confirmed",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.green),
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
                    text: "4",
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
                    text: "4",
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
                    text: "2023-10-18 04:14:00",
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
                onPressed: () {},
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
                  "Modify Reservation",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
