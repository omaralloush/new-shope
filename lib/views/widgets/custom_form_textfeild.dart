// import '../../core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  final String? hint;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  const CustomFormTextField(
      {this.hint, this.onChanged, this.validator, super.key});

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    bool isUserName = widget.hint == 'User Name';
    bool isPassword = widget.hint == 'Password';
    bool isName = widget.hint![0] == 'F' || widget.hint![0] == 'L';
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[500]!))),
      child: TextFormField(
        obscureText: isPassword ? passwordVisible : false,
        validator: widget.validator,
        onChanged: widget.onChanged,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
            alignLabelWithHint: false,
            filled: false,
            iconColor: Theme.of(context).primaryColor,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  )
                : null,
            icon: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Icon(isName
                    ? Icons.format_color_text_rounded
                    : isUserName
                        ? Icons.person
                        : Icons.lock)),
            hintText: widget.hint,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 110, 109, 109)),
            border: InputBorder.none),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
