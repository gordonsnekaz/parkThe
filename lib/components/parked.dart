import 'package:flutter/material.dart';

class ParkedComponent extends StatefulWidget {
  final bool right;
  const ParkedComponent({
    super.key,
    required this.right,
  });

  @override
  State<ParkedComponent> createState() => _ParkedComponentState();
}

class _ParkedComponentState extends State<ParkedComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        border: Border(
          top: const BorderSide(color: Color(0xFFFFFFFF)),
          left: widget.right == true
              ? const BorderSide(color: Color(0xFFFFFFFF))
              : const BorderSide(),
          right: const BorderSide(),
          bottom: const BorderSide(color: Color(0xFFFFFFFF)),
        ),
      ),
      child: const Image(
        image: AssetImage('android/assets/parked-car.png'),
        width: 36,
        color: Color(0xff828282),
      ),
    );
  }
}
