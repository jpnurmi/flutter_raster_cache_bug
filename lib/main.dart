import 'package:flutter/widgets.dart';

// my_application.cc:
// gtk_window_set_default_size(window, 577, 381);

void main() {
  runApp(WidgetsApp(
    checkerboardRasterCacheImages: true,
    home: const MyHomePage(),
    color: const Color(0xFFFFFFFF),
    pageRouteBuilder: <T>(settings, builder) {
      return PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (context, animation, secondary) => builder(context),
      );
    },
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(55.5),
      child: Opacity(
        opacity: 0.99,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
          child: Center(
            child: Text(
              'Flutter',
              style: TextStyle(
                fontSize: 128,
                color: Color(0xFF2196F3),
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
