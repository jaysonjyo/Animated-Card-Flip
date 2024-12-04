import 'package:flutter/material.dart';

class CardFlipAnimation extends StatefulWidget {
  @override
  _CardFlipAnimationState createState() => _CardFlipAnimationState();
}

class _CardFlipAnimationState extends State<CardFlipAnimation> {
  bool isFront = true; // State to track if the front side is showing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Flip Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500), // Animation duration
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: isFront
                  ? buildFrontCard() // Show front card
                  : buildBackCard(), // Show back card
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isFront = !isFront; // Toggle card side
                });
              },
              child: Text(isFront ? 'View Back Side' : 'View Front Side'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFrontCard() {
    return Container(
      key: ValueKey(1), // Unique key for AnimatedSwitcher
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        'Front Side',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildBackCard() {
    return Container(
        key: ValueKey(2), // Unique key for AnimatedSwitcher
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
       alignment: Alignment.center,
        child: Text(
            'Back Side',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
    )
    );}
}
