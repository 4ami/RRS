import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/shared/fields_validator.dart';
import 'package:restaurant/core/shared/loading.dart';
import 'package:restaurant/data/repositories/delete_reservation_repo.dart';
import 'package:restaurant/data/repositories/table_reservation_repository.dart';
import 'package:restaurant/view/home/bloc/table_reservation/current_reservation/get_current_reservation_state.dart';
import 'package:restaurant/view/home/bloc/table_reservation/current_reservation/get_reservation_bloc.dart';
import 'package:restaurant/view/home/bloc/table_reservation/delete_reservation/delete_reservation_bloc.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_event.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';
import 'package:restaurant/view/home/widget/reservation_info.dart';

class ManageReservationWidget extends StatelessWidget {
  const ManageReservationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetReservationData(
            getReservationRepo: context.read<GetReservationRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => DeleteReservationBloc(
            deleteRepo: context.read<DeleteReservationRepo>(),
          ),
        ),
      ],
      child: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _reservation = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 25),
                    child: TextFormField(
                      validator: (value) =>
                          Validators.reservationIdValidator(value),
                      maxLength: 4,
                      controller: _reservation,
                      decoration: InputDecoration(
                        counter: const Offstage(),
                        enabledBorder: OutlineInputBorder(
                          gapPadding: 15,
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 1.3, color: Color(0xff002B5B)),
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
                ),
                SizedBox(
                  width: 300,
                  child: FilledButton(
                    onPressed: () {
                      setState(() {
                        if (_key.currentState!.validate()) {
                          context
                              .read<GetReservationData>()
                              .add(ReservationIDChange(id: _reservation.text));

                          context
                              .read<GetReservationData>()
                              .add(ReservationInfo());
                        }
                      });
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xff1A5F7A)),
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
                const SizedBox(height: 30),
                Expanded(
                  child: BlocBuilder<GetReservationData, GetReservationInfo>(
                    builder: (context, state) {
                      if (state.state is FaildGETReservationState) {
                        return const SizedBox();
                      } else if (state.state is SuccessfulGETReservationState) {
                        return GridView.builder(
                          shrinkWrap: false,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: 1,
                          itemBuilder: (context, index) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => DeleteReservationBloc(
                                  deleteRepo:
                                      context.read<DeleteReservationRepo>(),
                                ),
                              ),
                            ],
                            child:
                                ReservationInformation(detail: state.detail!),
                          ),
                        );
                      } else if (state.state is TriggerGETReservationState) {
                        return const Loading();
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
