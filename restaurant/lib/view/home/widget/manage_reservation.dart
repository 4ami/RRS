import 'package:flutter/material.dart';

class ManageReservationWidget extends StatelessWidget {
  const ManageReservationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Body();
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _reservation = TextEditingController();
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
              child: TextFormField(
                controller: _reservation,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    gapPadding: 15,
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1.3, color: Color(0xff002B5B)),
                  ),
                  label: Text(
                    "Reservation Number: ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: FilledButton(
                onPressed: () {
                  setState(() {
                    x = 3;
                  });
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xff1A5F7A)),
                ),
                child: Text(
                  "Check",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: x,
                itemBuilder: (context, index) => Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: ColoredBox(
                      color: Colors.white,
                      child: Text('$index'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
