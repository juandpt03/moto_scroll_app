import 'package:flutter/material.dart';
import 'package:moto_scroll_app/presentation/screens/widgets/logo.dart';

class ScrollListener extends StatelessWidget {
  final Function(double scrollFraction) onScroll;

  const ScrollListener({required this.onScroll, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.maxScrollExtent > 0) {
          final scrollFraction = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          onScroll(scrollFraction);
        }
        return true;
      },
      child: CustomScrollView(
        slivers: [
          SliverFloatingHeader(child: Logo()),
          SliverFillRemaining(
            child: SizedBox(height: height * 3),
          ),
        ],
      ),
    );
  }
}
