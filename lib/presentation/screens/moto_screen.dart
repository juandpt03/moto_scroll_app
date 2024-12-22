import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moto_scroll_app/presentation/providers/images_provider.dart';
import 'package:moto_scroll_app/presentation/screens/widgets/widgets.dart';

class MotoScreen extends ConsumerWidget {
  const MotoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(imagesProvider);
    final imagesNotifier = ref.read(imagesProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          if (imageState.currentImage != null)
            BackgroundImage(currentImage: imageState.currentImage!),
          ScrollListener(
            onScroll: (scrollFraction) =>
                imagesNotifier.updateCurrentImage(scrollFraction),
          ),
        ],
      ),
    );
  }
}
