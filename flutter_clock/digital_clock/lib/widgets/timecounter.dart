import 'package:flutter/material.dart';

class TimeCounter extends StatelessWidget {
  final hour;
  final minute;
  final format;

  const TimeCounter({
    Key key,
    @required this.hour,
    @required this.minute,
    @required this.format,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dsDigital = TextStyle(
      color: Colors.white,
      fontFamily: 'DsDigital',
      fontSize: MediaQuery.of(context).size.width / 5,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          hour,
          style: dsDigital,
          textAlign: TextAlign.right,
        ),
        Text(
          ":",
          style: dsDigital,
          textAlign: TextAlign.center,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              minute,
              style: dsDigital,
              textAlign: TextAlign.left,
            ),
            Text(
              format,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'DsDigital',
                fontSize: MediaQuery.of(context).size.width / 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
