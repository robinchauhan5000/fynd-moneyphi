import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:moneyphi/screens/sign_in/sing_in.dart';
import 'package:moneyphi/screens/sign_up/verify_mobile_number.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({Key? key}) : super(key: key);

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _animation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: const Offset(-1.2, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInCubic,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PageView(
                controller: _pageController,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        const Text(
                          "Sculpt your finances towards \na safer & stress-free furture",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.53,
                          color: Colors.orange,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        const Text(
                            "Navigate through the waves of\n uncertainties securely & safely",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.53,
                          color: Colors.orange,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SmoothPageIndicator(
                controller: _pageController, // PageController
                count: 2,
                effect: const WormEffect(
                    activeDotColor: Color(0xff00124C),
                    dotHeight: 12,
                    dotWidth: 12,
                    spacing: 20), // your preferred effect
                onDotClicked: (index) {}),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SlideTransition(
              position: _animation!,
              transformHitTests: true,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MobileNumber()));
                  },
                  child: const Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff00124C),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.6,
                        MediaQuery.of(context).size.height * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                        // Single tapped.
                      },
                    text: 'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff00124C),
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
