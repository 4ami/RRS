import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/shared/constants.dart';
import 'package:restaurant/core/shared/loading.dart';
import 'package:restaurant/data/models/table.dart';
import 'package:restaurant/data/repositories/table_reservation_reository.dart';
import 'package:restaurant/view/home/bloc/table_reservation/get_tables_bloc.dart';
import 'package:restaurant/view/home/bloc/table_reservation/get_tables_state.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_event.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';

class TableReservation extends StatelessWidget {
  const TableReservation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTablesBloc(tableRepo: context.read<GetTables>()),
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
  @override
  Widget build(BuildContext context) {
    final state = context.read<GetTablesBloc>();
    state.add(GetTablesData());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.go('/home'),
          color: Colors.white,
        ),
        elevation: 12,
        toolbarHeight: 80,
        title: Text(
          "Reserve Table",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<GetTablesBloc, GetTablesState>(
          builder: (context, state) {
            if (state.tableState is FailedGETTablesState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(errorIllustration),
                      height: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "${state.tableState.message} 😭.",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              );
            } else if (state.tableState is SuccessfulGETTablesState) {
              return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 50,
                ),
                itemCount: state.tables.length,
                itemBuilder: (context, index) =>
                    TableCard(table: state.tables[index]),
              );
            } else {
              return const Loading();
            }
          },
        ),
      ),
    );
  }
}

class TableCard extends StatelessWidget {
  const TableCard({super.key, required this.table});
  final Tables table;
  @override
  Widget build(BuildContext context) {
    bool isAvailable = table.availability == "Available" ? true : false;
    bool isInside = table.location == 'Inside' ? true : false;
    return GestureDetector(
      onTap: isAvailable ? () {} : null,
      child: Badge(
        backgroundColor: isAvailable ? Colors.greenAccent : Colors.redAccent,
        label: Text(table.availability),
        offset: Offset(isAvailable ? -50 : -60, 5),
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: const Color(0xffFFF2F2),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff57C5B6).withOpacity(.5),
                offset: const Offset(-1, 6),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 130,
                image: AssetImage(isInside ? insideTable : outsideTable),
                filterQuality: FilterQuality.high,
              ),
              // const SizedBox(height: 10),
              Text(
                'Table Number: ${table.tableNumber}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                'Location: ${table.location}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
