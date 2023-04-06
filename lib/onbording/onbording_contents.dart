class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
      title: "Track your work and get the result",
      image: "assets/images/image1.png",
      desc: "Rember to keep track of your professional accomplishments."
  ),

  OnboardingContents(
      title: "Stay organized with team",
      image: "assets/images/image2.png",
      desc: "But understand the contributions our colleagues make to our teams and copamies."
  ),

  OnboardingContents(
      title: "Get notified when work happens",
      image: "assets/images/image3.png",
      desc: "Take control of notifications, collaborate live or on your own time."
  ),
];