import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  bool obsCureText = true;
  final ValueChanged<String>? onChanged;

  CustomPasswordTextField({
    Key? key,
    this.controller,
    required this.hintText, this.onChanged,
  }) : super(key: key);

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: widget.obsCureText,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              widget.obsCureText = !widget.obsCureText;
            });
          },
          child: Icon(
            widget.obsCureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 20.0,
            color: Colors.grey,
          ),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
