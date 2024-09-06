class OnboardingModel {
  const OnboardingModel(
      {required this.title, required this.discription, required this.image});

  final String title;
  final String discription;
  final String image;
}

class OnboardingItmes{
List<OnboardingModel> items = const [
    OnboardingModel(
        title: 'Wide Assortment',
        discription: '15000+ products from 12 divrse categories to shop from',
        image: 'assets/images/onboarding1.png'),
    OnboardingModel(
        title: 'Har Din Sasta',
        discription: 'Great deals & offers everyday',
        image: 'assets/images/onboarding2.png'),
    OnboardingModel(
        title: 'Incredible Delivery Speed',
        discription: 'Bringing the store to your door',
        image: 'assets/images/onboarding3.png'),
  ];

}

