import 'package:bloc_book/features/home/presentation/views/home.dart';
import 'package:bloc_book/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    Future.delayed(
        const Duration(seconds: 2),
        () => Get.to(() => const HomeScreen(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 250)));
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.imagesBookly),
        const SizedBox(height: 15),
        AnimatedBuilder(
          builder: (context, _) {
            return SlideTransition(
              position: slidingAnimation,
              child: const Text(
                "Read Free Book",
                textAlign: TextAlign.center,
              ),
            );
          },
          animation: slidingAnimation,
        ),
      ],
    );
  }
}
