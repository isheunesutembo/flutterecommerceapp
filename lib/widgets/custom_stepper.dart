import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper(
      {required this.lowerLimit,
      required this.upperLimit,
      required this.stepValue,
      required this.iconSize,
      required this.value,
      required this.onChanged,
      Key? key})
      : super(key: key);
  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  int value;
  final ValueChanged<dynamic> onChanged;

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.remove,
              color: Colors.white,
              size: 20,
            ),
          ),
          onTap: () {
            setState(() {
              widget.value = widget.value == widget.lowerLimit
                  ? widget.lowerLimit
                  : widget.value -= widget.stepValue;
              widget.onChanged({"qty":widget.value,"type":"-"});
            });
          },
        ),
        SizedBox(
          width: widget.iconSize,
          child: Text(
            widget.value.toString(),
            style: TextStyle(
              fontSize: widget.value * 0.8,
              color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
          onTap: () {
            setState(() {
              widget.value = widget.value == widget.lowerLimit
                  ? widget.lowerLimit
                  : widget.value += widget.stepValue;

              widget.onChanged({{"qty":widget.value,"type":"+"}});
            });
          },
        ),
      ]),
    );
  }
}