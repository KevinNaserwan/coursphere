class SplashScreenData {
  final String imagePath;
  final String title;
  final String subtitle;
  final double width;

  SplashScreenData(this.imagePath, this.title, this.subtitle, this.width);
}

List<SplashScreenData> splashData = [
  SplashScreenData(
      'assets/images/splash-1.png',
      'Learn Anywhere Anytime',
      'You can learn all simple like a click, all time is your discretion',
      130),
  SplashScreenData('assets/images/splash-2.png', 'Explore New Skills',
      'Expand your horizons and learn new things every day', 206),
  SplashScreenData('assets/images/splash-3.png', 'Achieve Your Goals',
      'Stay focused and reach your goals with our platform', 130),
];
