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

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
  }

  int scrollIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: OnboardingItmes().items.length,
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
                      //height: MediaQuery.of(context).size.height / 1.5,
                    ),
                    const SizedBox(
                      height: 30,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 10,
                          width: scrollIndex == 0 ? 40 : 20,
                          decoration: BoxDecoration(
                              color: scrollIndex == 0
                                  ? Colors.blue
                                  : Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 10,
                          width: scrollIndex == 1 ? 40 : 20,
                          decoration: BoxDecoration(
                              color: scrollIndex == 1
                                  ? Colors.blue
                                  : Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 10,
                          width: scrollIndex == 2 ? 40 : 20,
                          decoration: BoxDecoration(
                              color: scrollIndex == 2
                                  ? Colors.blue
                                  : Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ],
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
                          const Color.fromARGB(255, 231, 54, 41),
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
