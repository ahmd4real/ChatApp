import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {required this.hidden, super.key, this.onChanged, this.hintText});
  String? hintText;
  bool hidden;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        obscureText: hidden,
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Field is Required';
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            child: const Icon(Icons.remove_red_eye),
            onTap: () {
              hidden = false;
            },
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 163, 255, 195))),
        ),
      ),
    );
  }
}
