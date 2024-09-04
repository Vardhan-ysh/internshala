import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internshala/Search/provider/internship_provider.dart';
import 'package:internshala/Search/search_page.dart';
import 'package:internshala/repository/internship_repository.dart';

class SplashScreen extends ConsumerStatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  double _opacity = 0.0;
  final InternshipRepository repository = InternshipRepository();

  @override
  void initState() {
    super.initState();
    _startAnimation();
    init();
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  Future<void> init() async {
    try {
      // Ensure the splash screen is shown for at least 2 seconds
      await Future.delayed(Duration(seconds: 2));

      // Fetch initial internships
      await ref.read(internshipProvider.notifier).fetchInternships();

      // Navigate to SearchPage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SearchPage(),
        ),
      );
    } catch (e) {
      print('Failed to fetch data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: Container(
                padding: const EdgeInsets.only(top: 320),
                width: 160,
                child: Image.asset('assets/images/splash.png'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: Container(
                padding: const EdgeInsets.only(bottom: 100),
                width: 160,
                child: Image.asset('assets/images/bottom.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
