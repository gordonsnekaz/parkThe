import 'package:flutter/material.dart';

class AvailableComponent extends StatefulWidget {
  final bool right;
  const AvailableComponent({
    super.key,
    required this.right,
  });

  @override
  State<AvailableComponent> createState() => _AvailableComponentState();
}

class _AvailableComponentState extends State<AvailableComponent> {
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
            right: BorderSide(),
            bottom: BorderSide(color: Color(0xFFFFFFFF)),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 14,
            ),
            const Text(
              "Available",
              style: TextStyle(
                color: Color(0xff51A71D),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 4,
                bottom: 10,
              ),
              child: GestureDetector(
                onTap: () => {},
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: const Color(0xff51A71D),
                      borderRadius: BorderRadius.circular(2)),
                  child: const Center(
                    child: Text(
                      "Directions",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
