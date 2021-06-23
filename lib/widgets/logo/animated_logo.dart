import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with TickerProviderStateMixin {
  late final AnimationController _controllerBig = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
    lowerBound: 0,
    upperBound: 1,
  )..repeat(reverse: false);

  late final AnimationController _controllerMid = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
    lowerBound: 0,
    upperBound: 1,
  )..repeat(reverse: false);

  late final AnimationController _controllerSmall = AnimationController(
    duration: const Duration(milliseconds: 1000),
    lowerBound: 1,
    upperBound: 25,
    vsync: this,
  )..stop();

  late final Tween<double> clockwise = Tween<double>(
    begin: 0,
    end: 1,
  );

  late final Tween<double> anticlockwise = Tween<double>(
    begin: 1,
    end: 0,
  );

  late final Tween<int> scaleUp = Tween<int>(
    begin: 1,
    end: 25,
  );

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      _controllerSmall.forward();
    });

    _controllerSmall.addListener(() {
      if (_controllerSmall.isCompleted) {
        setState(() {
          isFinished = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controllerBig.dispose();
    _controllerMid.dispose();
    _controllerSmall.dispose();
    super.dispose();
  }

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    if (isFinished) {
      Future.microtask(() {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      });
    }

    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Transform.scale(
        scale: 0.8,
        child: Stack(
          alignment: Alignment.center,
          children: [
            RotationTransition(
              turns: clockwise.animate(_controllerBig),
              child: SvgPicture.asset('assets/outer.svg'),
            ),
            RotationTransition(
              turns: anticlockwise.animate(_controllerMid),
              child: SvgPicture.asset('assets/inner.svg'),
            ),
            AnimatedBuilder(
              animation: scaleUp.animate(
                _controllerSmall,
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.scale(
                  scale: _controllerSmall.value,
                  child: child,
                );
              },
              child: SvgPicture.asset('assets/center.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
