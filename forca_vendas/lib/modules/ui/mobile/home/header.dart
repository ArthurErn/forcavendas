import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  final bool isColapsed;
  final String header;

  const CustomDrawerHeader({
    Key? key,
    required this.isColapsed,
    required this.header
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isColapsed) const SizedBox(width: 10),
          if (isColapsed)
            Expanded(
              flex: 3,
              child: Text(
                header,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                maxLines: 1,
              ),
            ),
        ],
      ),
    );
  }
}
