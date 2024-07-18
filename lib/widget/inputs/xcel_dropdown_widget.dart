import 'package:flutter/material.dart';
import '../../const/constants.dart';


class AppDropdownWidget<T> extends StatefulWidget {
  const AppDropdownWidget({
    Key? key,
    this.margin = 0,
    this.borderRadius = 15,
    required this.items,
    required this.onChanged,
    this.title,
    this.value,
    this.focusNode,
    this.hint,
    this.containerColor,
    this.inActiveBorderColor,
    this.iconColor,
    this.padding,
    this.titleFontWeight,
    this.titleInactiveColor,
    this.titleFontSize,
    this.isDisabled = false,
  }) : super(key: key);

  final String? title;
  final double? margin;
  final double? titleFontSize;
  final FocusNode? focusNode;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;
  final Widget? hint;
  final Color? containerColor;
  final Color? inActiveBorderColor;
  final Color? titleInactiveColor;
  final FontWeight? titleFontWeight;
  final Color? iconColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool isDisabled;

  @override
  // ignore: library_private_types_in_public_api
  _AppDropdownWidgetState<T> createState() => _AppDropdownWidgetState<T>();
}

class _AppDropdownWidgetState<T> extends State<AppDropdownWidget<T>> {
  bool _isFocused = false;
  late FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (widget.title == null)
            const SizedBox.shrink()
          else
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                widget.title!,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: appColors.black,
                ),
              ),
            ),
          IgnorePointer(
            ignoring: widget.isDisabled,
            child: FocusScope(
              child: Focus(
                onFocusChange: (hasFocus) {
                  setState(() {
                    _isFocused = hasFocus;
                  });
                },
                child: Container(
                  padding: widget.padding ??
                      EdgeInsets.only(
                        left: 15,
                        right: 15,
                        bottom: 5,
                        top: 5,
                      ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    color: widget.containerColor ??
                        (widget.isDisabled
                            ? appColors.greyDADADA
                            : appColors.transparent),
                    border: Border.all(
                      color: _isFocused
                          ? appColors.blue
                          : widget.inActiveBorderColor ?? appColors.greyDADADA,
                    ),
                  ),
                  child: DropdownButton<T>(
                    value: widget.value,
                    focusNode: myFocusNode,
                    isExpanded: true,
                    hint: widget.hint,
                    underline: const SizedBox.shrink(),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: appColors.grey9D9D9D,
                    ),
                    items: widget.items,
                    onChanged: widget.onChanged,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
