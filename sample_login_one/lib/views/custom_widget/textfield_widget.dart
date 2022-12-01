import 'package:flutter/material.dart';
import 'package:localpath/resource/AppContextExtension.dart';
import '../login/login_view.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData? suffixIconData;
  final bool obscureText;
  final Function? onChanged;
  final Function(String)? onTap;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIconData,
    this.suffixIconData,
    required this.obscureText,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) {
        onChanged;
      },
      obscureText: obscureText,
      autocorrect: false,
      style: TextStyle(
        color: context.resources.color.colorMediumBlue,
        fontSize: context.resources.dimension.smallText14,
      ),
      cursorColor: context.resources.color.colorMediumBlue,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: context.resources.dimension.defaultText,
          color: context.resources.color.colorMediumBlue,
        ),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius:
              BorderRadius.circular(context.resources.dimension.mediumMargin),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(context.resources.dimension.mediumMargin),
            borderSide:
                BorderSide(color: context.resources.color.colorMediumBlue)),
        suffixIcon: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!(hintText);
            }
          },
          child: Icon(
            suffixIconData,
            size: context.resources.dimension.mediumText,
            color: context.resources.color.colorMediumBlue,
          ),
        ),
        labelStyle: TextStyle(color: context.resources.color.colorMediumBlue),
        focusColor: context.resources.color.colorMediumBlue,
      ),
    );
  }
}
