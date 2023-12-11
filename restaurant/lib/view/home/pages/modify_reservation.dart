import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/shared/constants.dart';
import 'package:restaurant/core/shared/fields_validator.dart';
import 'package:restaurant/core/shared/loading.dart';
import 'package:restaurant/data/models/reservation_detail.dart';
import 'package:restaurant/data/repositories/update_repo.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_event.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';
import 'package:restaurant/view/home/bloc/table_reservation/update_reservation/update_bloc.dart';
import 'package:restaurant/view/home/bloc/table_reservation/update_reservation/update_state.dart';
import 'package:restaurant/view/home/widget/failed.dart';
import 'package:restaurant/view/home/widget/table_reservation_textfield.dart';
import 'package:restaurant/view/home/widget/update_success.dart';

class ModifyReservation extends StatelessWidget {
  const ModifyReservation({super.key, required this.detail});
  final ReservationDetail detail;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UpdateReservationBloc(
            updateRepo: context.read<UpdateReservationRepo>()),
        child: Body(detail: detail));
  }
}

class Body extends StatefulWidget {
  const Body({super.key, required this.detail});

  final ReservationDetail detail;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _partySize = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  DateTime? date;
  TimeOfDay? time;
  Color _color = Colors.lightGreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () => context.pop(),
          ),
          toolbarHeight: 80,
          centerTitle: true,
          title: Text(
            'Table Number: ${widget.detail.table.tableNumber}',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                // TableInformation(table: widget.table),
                const SizedBox(height: 50),
                Text(
                  "Reservation Form",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: const Color(0xff159895)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFieldElement(
                        label: 'Phone:',
                        hint: '55X24X14X',
                        maxLength: 9,
                        controller: _phone,
                        validator: Validators.phoneNumberValidator,
                        prefexIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Image(
                            image: AssetImage(phoneCode),
                            width: 70,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFieldElement(
                        textInputType: const TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        label: 'Party Size:',
                        hint: 'Number Only',
                        maxLength: 2,
                        controller: _partySize,
                        validator: Validators.partySizeValidator,
                        prefexIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(Icons.emoji_people),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(_color),
                          ),
                          onPressed: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2024, 12),
                            ).then((value) {
                              setState(() {
                                date = value!;
                                debugPrint(date.toString());
                              });
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pick a Date",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(width: 35),
                              const Icon(Icons.date_range),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(_color),
                          ),
                          onPressed: () async {
                            await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              setState(
                                () {
                                  time = value!;
                                  debugPrint(time.toString());
                                },
                              );
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pick a Time",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(width: 35),
                              const Icon(Icons.more_time)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: FilledButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff1A5F7A)),
                          ),
                          onPressed: () {
                            setState(() {
                              if (_key.currentState!.validate() &&
                                  date != null &&
                                  time != null) {
                                _color = Colors.lightGreen;
                                // send date to back-end
                                final String dateTime =
                                    "${date!.year}-${date!.month}-${date!.day} ${time!.hour}:${time!.minute}:00Z";

                                context.read<UpdateReservationBloc>().add(
                                    UpdateReservationEvent(
                                        partySize: int.parse(_partySize.text),
                                        id: widget.detail.id,
                                        dateTime: dateTime,
                                        phone: "+966${_phone.text}"));
                                return;
                              }
                              _color = Colors.redAccent;
                            });
                          },
                          child: Text(
                            "Submit Reservation",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50)
                    ],
                  ),
                ),
              ],
            ),
            BlocBuilder<UpdateReservationBloc, UpdateReservationState>(
              builder: (context, state) {
                if (state.state is SuccessfulNewReservationState) {
                  return GestureDetector(
                    onTap: () => context.pop(),
                    child: SuccessUpdatePromptUser(id: widget.detail.id),
                  );
                } else if (state.state
                    is TriggerNewReservationState) {
                  return const Loading();
                } else if (state.state is FaildNewReservationState) {
                  return GestureDetector(
                    onTap: () => context.pop(),
                    child:
                        ErrorPromptUser(error: state.state.message),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
