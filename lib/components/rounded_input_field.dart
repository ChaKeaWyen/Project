import 'package:almost/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'textfield_container.dart';

// ignore: must_be_immutable
class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  Profile profile = Profile(email: '', password: '');
  RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
            validator: MultiValidator([
              RequiredValidator(errorText: "Please enter your Email"),
              EmailValidator(errorText: "Invalid Email format")
            ]),
            keyboardType: TextInputType.emailAddress,
            onSaved: (String? email) {
              profile.email = email!;
            },
            onChanged: onChanged,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              icon: Icon(
                icon,
                color: Colors.white,
              ),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 18, color: Colors.white),
              border: InputBorder.none,
            )));
  }
}
