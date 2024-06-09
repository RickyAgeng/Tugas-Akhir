import 'package:flutter/material.dart';
import 'package:presensismk/widgets/constants.dart';
import 'package:presensismk/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: "Password",
          hintStyle: const TextStyle(fontFamily: 'OpenDans'),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none
        ),
      ),
    );
  }
}
