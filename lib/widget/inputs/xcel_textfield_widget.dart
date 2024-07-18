// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import '../../const/constants.dart';
import '../../const/funcs.dart';
import '../app_text_widget.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? suffixWidget;
  // final Widget? prefixWidget;
  final Widget? prefixIcon;
  final Widget? prefix;
  final bool isPasswordField;
  final bool? enabled;
  final String? titleText;
  final TextInputAction? textInputAction;
  final int? maxlines;
  final double? enableborderwidth;
  final Color? enableborderColor;
  final TextInputType? textInputType;
  final Function(String value)? onchanged;
  final Function(String value)? onSaved;
  final String? Function(String?)? validator;
  final Function(String value)? onFieldSubmitted;
  final Color? titleColor;
  final FontWeight? titleFontWeight;
  final String? obsucringText;
  final Color? hintTextColor;
  final VoidCallback? onTap;
  final bool? readOnly;
  final bool? filled;
  final Color? filledColor;

  const AppTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.prefixText,
    this.textInputAction,
    this.suffixIcon,
    this.suffixWidget,
    this.prefix,
    //  this.prefixWidget,
    this.prefixIcon,
    this.maxlines,
    this.isPasswordField = false,
    this.enabled,
    this.textInputType,
    this.onchanged,
    this.onSaved,
    this.enableborderColor,
    this.enableborderwidth,
    this.validator,
    this.onFieldSubmitted,
    this.titleText,
    this.titleColor,
    this.obsucringText,
    this.hintTextColor,
    this.titleFontWeight,
    this.onTap,
    this.readOnly,
    this.filled,
    this.filledColor,
  }) : super(key: key);

  @override
  _UniversalTextFormFieldState createState() => _UniversalTextFormFieldState();
}

class _UniversalTextFormFieldState extends State<AppTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
          text: widget.titleText ?? '',
          color: widget.titleColor ?? appColors.black,
          fontWeight: widget.titleFontWeight ?? FontWeight.w400,
          fontsize: getFontSize(15, size),
        ),
        widget.titleText != ''
            ? createSpace(size, 5, "vertical")
            : const SizedBox.shrink(),
        TextFormField(
          maxLines: widget.maxlines ?? 1,
          // expands: true,
          inputFormatters: const [
            // FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s"))
          ],
          readOnly: widget.readOnly ?? false,
          obscuringCharacter: '●',
          //onSaved: widget.onSaved,
          onTap: widget.onTap,
          onChanged: widget.onchanged,
          validator: widget.validator,
          obscureText: widget.isPasswordField ? obscureText : false,
          keyboardType: widget.textInputType,
          style: TextStyle(
              color: Colors.black,
              //fontFamily: 'Outfit',
              fontSize: getFontSize(20, size),
              fontWeight: FontWeight.w400),
          controller: widget.controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            filled: widget.filled ?? false,
            fillColor: widget.filledColor ?? Colors.white,
            enabled: widget.enabled ?? true,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            prefix: widget.prefix,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    color: Colors.grey,
                    icon: obscureText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_sharp),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                : widget.suffixWidget,
            prefixStyle: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            hintStyle: TextStyle(
                color: widget.hintTextColor ?? appColors.lightGrey828280,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            focusColor: Colors.grey,
            disabledBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(0),
              ),
              borderSide: BorderSide(
                  width: widget.enableborderwidth ?? 0,
                  color: widget.enableborderColor ?? appColors.black),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class XcelTextformfieldfortransfer extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? suffixWidget;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? titleText;
  final TextInputAction? textInputAction;
  final bool? filled;

  final TextInputType? textInputType;
  final Function(String value)? onchanged;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  const XcelTextformfieldfortransfer({
    Key? key,
    required this.controller,
    this.hintText,
    this.prefixText,
    this.suffixIcon,
    this.suffixWidget,
    this.prefix,
    this.textInputAction,
    this.prefixIcon,
    this.textInputType,
    this.onchanged,
    this.validator,
    this.titleText,
    this.filled,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  _XcelTextformfieldfortransferState createState() =>
      _XcelTextformfieldfortransferState();
}

class _XcelTextformfieldfortransferState
    extends State<XcelTextformfieldfortransfer> {
  bool obscureText = true;

  final formatter = NumberFormat("#,###", "en_US");
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 22,
      child: TextFormField(
        textAlign: TextAlign.start,
        inputFormatters: [
          NumberTextInputFormatter(
            integerDigits: 10,
            decimalDigits: 2,
            maxValue: '100000000',
            decimalSeparator: '.',
            groupDigits: 3,
            groupSeparator: ',',
            allowNegative: false,
            overrideDecimalPoint: true,
            insertDecimalPoint: true,
            insertDecimalDigits: true,
          ),
        ],
        onChanged: widget.onchanged,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        onFieldSubmitted: widget.onFieldSubmitted,
        style: TextStyle(
          color: appColors.grey9D9D9D,
          fontSize: getFontSize(10, size),
          fontWeight: FontWeight.w500,
        ),
        controller: widget.controller,
        cursorColor: appColors.black,
        cursorWidth: 3,
        cursorHeight: 20,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          isDense: true,
          filled: widget.filled ?? false,
          fillColor: appColors.red,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          prefix: widget.prefix,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          contentPadding: const EdgeInsets.all(0),
          prefixStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'Causten',
          ),
          hintStyle: TextStyle(
            color: appColors.grey9D9D9D,
            fontSize: getFontSize(12, size),
            fontWeight: FontWeight.w500,
          ),
          focusColor: Colors.grey,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class XcelTextFormFieldSpace extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? suffixWidget;
  // final Widget? prefixWidget;
  final Widget? prefixIcon;
  final Widget? prefix;
  final bool isPasswordField;
  final bool? enabled;
  final bool? readOnly;
  final String? titleText;
  final TextInputAction? textInputAction;
  final int? maxlines;
  final double? enableborderwidth;
  final Color? enableborderColor;
  final TextInputType? textInputType;
  final Function(String value)? onchanged;
  final String? Function(String?)? validator;
  final Function(String value)? onFieldSubmitted;
  final Color? titleColor;
  final FontWeight? titleFontWeight;
  final String? obsucringText;
  final Color? hintTextColor;

  const XcelTextFormFieldSpace({
    Key? key,
    required this.controller,
    this.hintText,
    this.prefixText,
    this.textInputAction,
    this.suffixIcon,
    this.suffixWidget,
    this.prefix,
    //  this.prefixWidget,
    this.prefixIcon,
    this.maxlines,
    this.isPasswordField = false,
    this.enabled,
    this.textInputType,
    this.onchanged,
    this.enableborderColor,
    this.enableborderwidth,
    this.validator,
    this.onFieldSubmitted,
    this.titleText,
    this.titleColor,
    this.obsucringText,
    this.hintTextColor,
    this.titleFontWeight,
    this.readOnly,
  }) : super(key: key);

  @override
  _XcelTextFormFieldSpaceState createState() => _XcelTextFormFieldSpaceState();
}

class _XcelTextFormFieldSpaceState extends State<XcelTextFormFieldSpace> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextWidget(
          text: widget.titleText ?? '',
          color: widget.titleColor ?? appColors.black,
          fontWeight: widget.titleFontWeight ?? FontWeight.w400,
          fontsize: 15,
        ),
        widget.titleText != ''
            ? createSpace(size, 10, "vertical")
            : const SizedBox.shrink(),
        TextFormField(
          maxLines: widget.maxlines ?? 1,
          // expands: true,
          obscuringCharacter: '●',

          onChanged: widget.onchanged,
          validator: widget.validator,
          obscureText: widget.isPasswordField ? obscureText : false,
          keyboardType: widget.textInputType,
          readOnly: widget.readOnly!,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Outfit',
              fontSize: getFontSize(10, size),
              fontWeight: FontWeight.w400),
          controller: widget.controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            enabled: widget.enabled ?? true,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            prefix: widget.prefix,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    color: Colors.grey,
                    icon: obscureText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_sharp),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                : widget.suffixWidget,
            prefixStyle: const TextStyle(
                color: Colors.black, fontSize: 15, fontFamily: 'Outfit'),
            hintStyle: TextStyle(
                color: widget.hintTextColor ?? appColors.lightGrey828280,
                fontSize: getFontSize(6, size),
                fontWeight: FontWeight.w400),
            focusColor: Colors.grey,
            disabledBorder: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
              borderSide: BorderSide(
                  width: widget.enableborderwidth ?? 0,
                  color: widget.enableborderColor ?? appColors.black),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
