import 'package:flutter/material.dart';

List<Widget> tabs(BuildContext context) => [
      Text(
        'Appetizers',
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white, fontSize: 20),
      ),
      Text(
        'Main Course',
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white, fontSize: 20),
      ),
      Text(
        'Desserts',
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white, fontSize: 20),
      ),
      Text(
        'Beverages',
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white, fontSize: 20),
      ),
      Text(
        'Salads',
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white, fontSize: 20),
      ),
    ];
