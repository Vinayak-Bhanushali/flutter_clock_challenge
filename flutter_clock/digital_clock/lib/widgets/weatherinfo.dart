import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_clock_helper/model.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherCondition condition;
  final String unit;
  final String temperature;
  final String low;
  final String high;

  WeatherInfo({
    Key key,
    @required this.condition,
    @required this.unit,
    @required this.temperature,
    @required this.low,
    @required this.high,
  }) : super(key: key);

  final String _date = DateFormat('D-MMM-y').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Tab getWeatherIcons() {
      Tab tab;
      switch (condition) {
        case WeatherCondition.cloudy:
          tab = Tab(
            icon: Image.asset(
              "assets/icons/cloudy.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          );
          break;
        case WeatherCondition.foggy:
          tab = Tab(
            icon: Image.asset(
              "assets/icons/foggy.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          );
          break;
        case WeatherCondition.rainy:
          tab = Tab(
            icon: Image.asset(
              "assets/icons/rainy.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          );
          break;
        case WeatherCondition.snowy:
          tab = Tab(
            icon: Image.asset(
              "assets/icons/snowy.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          );
          break;
        case WeatherCondition.sunny:
          tab = Tab(
            icon: Image.asset(
              "assets/icons/sunny.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          );
          break;
        case WeatherCondition.thunderstorm:
          tab = Tab(
            icon: Image.asset(
              "assets/icons/thunderstorm.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          );
          break;
        case WeatherCondition.windy:
          tab = Tab(
            icon: Image.asset(
              "assets/icons/windy.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
          );
          break;
      }
      return tab;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              getWeatherIcons(),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    temperature + unit,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    condition
                        .toString()
                        .replaceFirst("WeatherCondition.", "")
                        .toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            _date,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontSize: MediaQuery.of(context).size.width / 30,
            ),
          )
        ],
      ),
    );
  }
}
