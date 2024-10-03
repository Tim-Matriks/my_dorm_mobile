// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';

class LoginTextField extends StatefulWidget {
  final int? maxLines;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final bool isPassword;
  const LoginTextField({
    super.key,
    this.maxLines,
    required this.label,
    required this.controller,
    this.validator,
    this.onChanged,
    required this.isPassword,
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: (widget.isPassword)?_isObscured:false,
      onChanged: widget.onChanged,
      style: kSemiBoldTextStyle.copyWith(fontSize: 16),
      decoration: InputDecoration(
        label: Text(widget.label, style: kRegularTextStyle.copyWith(color: kRed),),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kRed, width: 2),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 2),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        hintStyle: kRegularTextStyle.copyWith(fontSize: 16),
        suffixIcon: widget.isPassword
            ? IconButton(
                splashRadius: 30,
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                icon: _isObscured
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : null,
      ),
    );
  }
}
