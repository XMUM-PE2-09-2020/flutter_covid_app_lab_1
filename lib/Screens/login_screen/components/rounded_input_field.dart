import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final IconData icon, suffixIcon;
  final ValueChanged<String> onSaved;
  final Function validator;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onSaved,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        key: key,
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            suffixIcon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
