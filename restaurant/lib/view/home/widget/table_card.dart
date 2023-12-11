import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/shared/constants.dart';
import 'package:restaurant/data/models/table.dart';

class TableCard extends StatelessWidget {
  const TableCard({super.key, required this.table});
  final Tables table;
  @override
  Widget build(BuildContext context) {
    bool isAvailable = table.availability == "Available";
    bool isInside = table.location.toLowerCase() == 'inside';
    return GestureDetector(
      onTap: isAvailable
          ? () => context.push('/home/table-reservation/reserver-form',
              extra: table)
          : null,
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
