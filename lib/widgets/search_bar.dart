import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final Widget? suffixIcon;

  const SearchField(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(height: 1),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(height: 1),
        prefixIcon: Icon(Icons.search),
        suffixIcon: suffixIcon ?? null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
