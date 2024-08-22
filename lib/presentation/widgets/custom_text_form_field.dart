// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/core/utils/constant.dart';
import 'package:example_fish_fortune/core/utils/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:svg_flutter/svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool isPassword;
  final bool obscureText;
  final String errorText;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool? enabled;
  final String? initialValue;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.isPassword = false,
    this.obscureText = false,
    this.errorText = "",
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.isRequired = true,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.validator,
    this.enabled,
    this.initialValue,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  void initState() {
    super.initState();

    obscureText = widget.obscureText;
  }

  void onTapSuffix() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: BaseColor.black,
        height: 1,
      ),
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontFamily: Constant.GENERAL_SANS,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xffAAAAAA),
        ),
        floatingLabelStyle: const TextStyle(
          fontFamily: Constant.CLASH_DISPLAY,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: BaseColor.black,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: widget.isPassword
            ? obscureText
                ? IconButton(
                    icon: SvgPicture.asset(Assets.icEyeClosed),
                    onPressed: onTapSuffix,
                  )
                : IconButton(
                    onPressed: onTapSuffix,
                    icon: SvgPicture.asset(Assets.icEye),
                  )
            : null,
        errorText: widget.errorText.isNotEmpty ? widget.errorText : null,
        fillColor: widget.enabled == false ? const Color(0xffDBDBDB) : null,
      ),
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
      obscureText: obscureText,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      textCapitalization: widget.textCapitalization,
      enabled: widget.enabled,
      buildCounter: (context,
          {required currentLength, required isFocused, required maxLength}) {
        return const SizedBox();
      },
      validator: widget.validator ??
          (value) {
            if (widget.isRequired && (value ?? "").trim().isEmpty) {
              return ErrorMessage.required;
            }

            return null;
          },
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
    );
  }
}
