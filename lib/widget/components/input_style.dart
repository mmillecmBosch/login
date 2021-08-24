import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputStyle extends StatefulWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool password;
  var obscureText;

  InputStyle(
    this.label,
    this.icon,
    this.password,
    this.controller,
  ) {
    obscureText = password;
  }

  @override
  _InputStyleState createState() => _InputStyleState();
}

class _InputStyleState extends State<InputStyle> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(
        color: Colors.white,
      ),
      obscureText: widget.obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Black Space, please enter some text';
        }
        return null;
      },
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Color.fromRGBO(164, 150, 148, 1),
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Color.fromRGBO(213, 160, 33, 1),
        ),
        suffixIcon: widget.password
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Color.fromRGBO(213, 160, 33, 1),
                ))
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color.fromRGBO(115, 107, 96, 1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color.fromRGBO(115, 107, 96, 1),
          ),
        ),
      ),
    );
  }
}
