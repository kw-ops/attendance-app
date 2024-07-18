import 'dart:async';
import 'package:attendance/const/funcs.dart';
import 'package:attendance/widget/app_text_widget.dart';
import 'package:flutter/material.dart';

import '../const/constants.dart';

class CustomSliderButton extends StatefulWidget {
  final double width;
  final double height;
  final Widget routerPage;

  const CustomSliderButton({
    super.key,
    required this.width,
    required this.height,
    required this.routerPage,
  });

  @override
  _CustomSliderButtonState createState() => _CustomSliderButtonState();
}

class _CustomSliderButtonState extends State<CustomSliderButton>
    with SingleTickerProviderStateMixin {
  double _value = 0.0;
  bool _isDragging = false;
  bool _isSlideCompleted = false;
  

  late AnimationController _controller;
  late Animation<double> _animation;
  

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateValue(double newValue) {
    setState(() {
      _value = newValue.clamp(0.0, 1.0);
      if (_value == 1) {
        _isSlideCompleted = true;
        _controller.forward();
      } else {
        _isSlideCompleted = false;
        _controller.reset();
      }
    });

    if (_isSlideCompleted) {
      Timer(const Duration(milliseconds: 1500), () async {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => widget.routerPage));
        // widget.routerPage;
      });
    }
  }

  void _onTapDown(TapDownDetails details) {
    _isDragging = true;
    _updateValue(details.localPosition.dx / widget.width);
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _isDragging = true;
    _updateValue(details.localPosition.dx / widget.width);
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    _isDragging = false;
    if (!_isSlideCompleted) {
      _updateValue(0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: _onHorizontalDragEnd,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.height / 1),
            color: appColors.white,
            boxShadow: [
              BoxShadow(
                color: appColors.black0002,
                offset: const Offset(1, 3),
                blurRadius: 2,
                spreadRadius: 2,
              )
            ],
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _value < 0.1
                    ? _value * widget.width
                    : (_value + 0.05) * widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.height / 1),
                  color: _isSlideCompleted ? Colors.green : appColors.red,
                ),
              ),
              if (!_isSlideCompleted)
                Positioned(
                  top: widget.height * 0.1,
                  left: _value * (widget.width - widget.height) +
                      widget.height * 0.1,
                  child: Container(
                    width: widget.height * 0.8,
                    height: widget.height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.height / 1),
                      // shape: BoxShape.circle,
                      color: appColors.red,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              if (!_isSlideCompleted)
                Positioned(
                  top: widget.height * 0.25,
                  right: _value * (widget.width - widget.height) +
                      widget.height * 0.01,
                  child: Container(
                    width: widget.width - widget.height,
                    height: widget.height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.height / 1),
                      color: Colors.transparent,
                    ),
                    child: AppTextWidget(
                      text: "Slide to take roll",
                      fontsize: getFontSize(22, size),
                      color: appColors.black0002,
                    ),
                  ),
                ),
              if (_isSlideCompleted)
                Positioned(
                  top: 0,
                  left: 0,
                  child: FadeTransition(
                    opacity: _animation,
                    child: SizedBox(
                      width: widget.width,
                      height: widget.height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            color: appColors.white,
                            size: getFontSize(18, size),
                          ),
                          createSpace(size, 20, 'horizontal'),
                          AppTextWidget(
                            text: 'Successful',
                            fontsize: getFontSize(16, size),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
