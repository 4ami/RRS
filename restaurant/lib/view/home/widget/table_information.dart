import 'package:flutter/material.dart';
import 'package:restaurant/data/models/table.dart';

class TableInformation extends StatelessWidget {
  const TableInformation({
    super.key,
    required this.table,
  });

  final Tables table;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Container(
          width: 350,
          height: 200,
          decoration: BoxDecoration(
            color: const Color(0xff57C5B6).withOpacity(.4),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff1A5F7A).withOpacity(.2),
                offset: const Offset(3, 16),
                blurRadius: 16,
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Table Information",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text.rich(
                    TextSpan(
                      text: "Table Location: ",
                      children: [
                        TextSpan(
                          text: table.location,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.red),
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      text: 'Table Availability: ',
                      children: [
                        TextSpan(
                          text: table.availability,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: table.availability == 'Available'
                                        ? const Color(0xff159895)
                                        : Colors.red,
                                  ),
                        ),
                      ],
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
