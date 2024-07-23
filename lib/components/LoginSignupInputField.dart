import 'package:barfly_user/appConstants.dart';
import 'package:flutter/material.dart';

class LoginSignUpInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const LoginSignUpInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.isPassword,
  }) : super(key: key);

  @override
  _LoginSignUpInputFieldState createState() => _LoginSignUpInputFieldState();
}

class _LoginSignUpInputFieldState extends State<LoginSignUpInputField> {
  bool obscureText = true;
  void _toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
        child: TextField(
          controller: widget.controller,
          style: const TextStyle(color: Colors.white),
          obscureText: widget.isPassword ? obscureText : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF4f5273),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffixIcon: widget.isPassword
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: obscureText
                              ? Colors.grey
                              : AppColors.backgroundColor,
                        ),
                        onPressed: _toggleObscureText),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

            // focusedBorder:
          ),
        ),
      ),
    );
  }
}
