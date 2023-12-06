import 'package:flutter/material.dart';

typedef ValidatorCallback = String? Function(String?);

class CustomField extends StatefulWidget {
  const CustomField({
    super.key,
    required this.validator,
    required this.controller,
    required this.label,
    required this.hint,
    this.isObscure = false,
  });
  final String label;
  final String hint;
  final bool isObscure;
  final ValidatorCallback validator;
  final TextEditingController controller;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextFormField(
        validator: widget.validator,
        obscureText: widget.isObscure,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hint,
          label: Text(
            widget.label,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.black45),
          ),
        ),
      ),
    );
  }
}
