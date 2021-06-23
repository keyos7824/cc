import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {
  final VoidCallback? onComplete;
  final IconData icon;
  final String? text;

  const SliderButton({
    Key? key,
    required this.onComplete,
    required this.icon,
    required this.text,
  }) : super(key: key);
  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  double xValue = 8;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        print(details.localPosition.dx);
        setState(() {
          xValue = details.localPosition.dx;
        });
        if (xValue > 250) {
          widget.onComplete!();
        }
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (xValue < 250) {
          setState(() {
            xValue = 8;
          });
        } else {
          print("Finished");
          widget.onComplete!();
        }
      },
      onTap: widget.onComplete,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Positioned(
              left: xValue,
              top: 8,
              child: Icon(
                widget.icon,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.text!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
