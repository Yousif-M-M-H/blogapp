import 'package:flutter/material.dart';

class MembersTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  MembersTextField({
    required this.label,
    this.obscureText = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
          validator: validator,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
