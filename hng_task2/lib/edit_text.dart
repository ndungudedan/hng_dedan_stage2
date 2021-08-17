import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? helperText;
  final String? hintText;

  CustomTextField(
      {this.controller, this.helperText, this.hintText, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 15, 20, 20),
      height: 80,
      child: TextFormField(
        validator: (value) {
          if (value != null && value.isNotEmpty) {
            return null;
          } else {
            return 'Please fill field';
          }
        },
        controller: controller,
        decoration: InputDecoration(
          helperText: helperText,
          labelText: label,
          border: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
        ),
      ),
    );
  }
}
