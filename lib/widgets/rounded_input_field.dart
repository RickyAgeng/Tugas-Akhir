import 'package:flutter/material.dart';
import 'package:presensismk/widgets/constants.dart';
import 'package:presensismk/widgets/widgets.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({Key? key, this.hintText,this.icon = Icons.person }) : super(key: key);
  final String? hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontFamily: 'OpenSans'),
          border: InputBorder.none
        ),
      ),
    );
  }
}
