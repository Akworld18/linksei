import 'package:flutter/material.dart';


class AnimatedListWidget extends StatefulWidget {

  final int index;
  final AnimationController animationController;
  final double duration;
  final Size pageSize;
  final Widget page;

  AnimatedListWidget({super.key, required this.index, required this.animationController, required this.duration,required this.pageSize, required this.page});

  @override
  _AnimatedListWidgetState createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  Animation? _animation;
  double start = 0;
  double end = 0;

  @override
  void initState() {
    super.initState();
    start = (widget.duration * widget.index ).toDouble();
    end = start + widget.duration;
    print("START $start , end $end");
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          start,
          end,
          curve: Curves.easeIn,
        ),
      ),
    )..addListener((){
      setState(() {
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animation?.value,
      child: widget.page,
    );
  }
}