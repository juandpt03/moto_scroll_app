import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              height: size.height * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFFBA3816), Color(0xFFA41705)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        Image.asset(
          height: size.height * 0.03,
          'assets/logo.png',
        ),
      ],
    );
  }
}
