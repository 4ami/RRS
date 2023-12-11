import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/shared/error_response.dart';
import 'package:restaurant/core/shared/loading.dart';
import 'package:restaurant/data/repositories/table_reservation_repository.dart';
import 'package:restaurant/view/home/bloc/table_reservation/get_tables_bloc.dart';
import 'package:restaurant/view/home/bloc/table_reservation/get_tables_state.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_event.dart';
import 'package:restaurant/view/home/bloc/table_reservation/table_reservation_state.dart';
import 'package:restaurant/view/home/widget/table_card.dart';

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
              return ErrorResponse(message: state.tableState.message);
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
