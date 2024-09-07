import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prm_cart/models/onboarding_model.dart';
import 'package:prm_cart/theme/style.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnboardingItmes();
  final pageController = PageController();
  Timer? _timer;
  int scrollIndex = 0;
  final Duration _pageDuration =
      const Duration(seconds: 3); // Duration between page transitions

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when disposing the widget
    pageController.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(_pageDuration, (Timer timer) {
      final nextPage = (scrollIndex + 1) % controller.items.length;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: controller.items.length,
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  scrollIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      controller.items[index].image,
                      height: MediaQuery.of(context).size.height / 1.5,
                      fit: BoxFit.fill,
                    ),
                    Text(controller.items[index].title,
                        style: AppWidget().green32()),
                    Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 50, right: 50, top: 12),
                        child: Text(
                          controller.items[index].discription,
                          style: AppWidget().black18(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.items.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 10,
                          width: scrollIndex == index ? 60 : 15,
                          decoration: BoxDecoration(
                              color: scrollIndex == index
                                  ? Colors.blue
                                  : Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 54, 41),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 50, right: 50, bottom: 10),
                    child: Center(
                      child: Text(
                        'Start shopping',
                        style: AppWidget().buttonText(Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 231, 54, 41),
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 50, right: 50, bottom: 10),
                    child: Center(
                      child: Text(
                        'Login/SignUp',
                        style: AppWidget().buttonText(
                          const Color.fromARGB(
                            255,
                            231,
                            54,
                            41,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
