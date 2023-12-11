import 'package:flutter/material.dart';

typedef ValidatorCallBack = String? Function(String?);

class TextFieldElement extends StatelessWidget {
  const TextFieldElement(
      {super.key,
      required this.controller,
      required this.validator,
      this.maxLength,
      this.prefexIcon,
      required this.hint,
      required this.label,
      this.textInputType
      });

  final TextEditingController controller;
  final ValidatorCallBack validator;
  final int? maxLength;
  final Widget? prefexIcon;
  final String label;
  final String hint;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType ?? TextInputType.phone,
        decoration: InputDecoration(
          label: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 18,
          ),
          counter: const Offstage(),
          prefixIcon: prefexIcon,
        ),
        maxLength: maxLength,
        validator: (value) => validator(value),
      ),
    );
  }
}
