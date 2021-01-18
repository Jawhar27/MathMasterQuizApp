import 'package:flutter/material.dart';
import 'package:mathquiz/screens/quizScreen.dart';

class MathOperator extends StatelessWidget {
  final String operatorType;
  final Icon icon;

  MathOperator({@required this.operatorType, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(QuizScreen.routeName, arguments: {'type': operatorType});
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            SizedBox(width: 5),
            icon,
            Container(
              margin: EdgeInsets.only(left: 65),
              child: Text(
                operatorType,
                style: TextStyle(
                    color: Colors.green[700], fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
