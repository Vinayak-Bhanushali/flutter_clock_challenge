// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:digital_clock/widgets/timecounter.dart';
import 'package:digital_clock/widgets/weatherinfo.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A basic digital clock.
///
/// You can do better than this!
class DigitalClock extends StatefulWidget {
  const DigitalClock(this.model);

  final ClockModel model;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime = DateTime.now();
  Timer _timer;

  Gradient _getBackground() {
    if (Theme.of(context).brightness == Brightness.dark) {
      return RadialGradient(
        colors: [
          Color(0xff071117),
          Color(0xff060a0f),
        ],
        radius: 1,
        center: const Alignment(0, 0.4),
      );
    } else {
      RadialGradient radialGradient;
      if (_dateTime.hour >= 4 && _dateTime.hour < 10) {
        radialGradient = RadialGradient(
          colors: [
            Color(0xff94b3b2),
            Color(0xff017397),
          ],
          radius: 1,
          center: const Alignment(0, 0.4),
        );
      } else if (_dateTime.hour >= 10 && _dateTime.hour < 16) {
        radialGradient = RadialGradient(
          colors: [
            Color(0xff66a5c1),
            Color(0xff004d8f),
          ],
          radius: 1,
          center: const Alignment(0, 0.4),
        );
      } else if (_dateTime.hour >= 16 && _dateTime.hour < 19) {
        radialGradient = RadialGradient(
          colors: [
            Color(0xfffca533),
            Color(0xffdf4313),
          ],
          radius: 1,
          center: const Alignment(0, 0.4),
        );
      } else if (_dateTime.hour >= 19 && _dateTime.hour < 4) {
        radialGradient = RadialGradient(
          colors: [
            Color(0xff071117),
            Color(0xff060a0f),
          ],
          radius: 1,
          center: const Alignment(0, 0.4),
        );
      }
      return radialGradient;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. If you want to update every second, use the
      // following code.
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final hour =
        DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);
    final minute = DateFormat('mm').format(_dateTime);

    return Container(
      decoration: BoxDecoration(
        gradient: _getBackground(),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Expanded(
            flex: 4,
            child: TimeCounter(
              hour: hour,
              minute: minute,
              format: widget.model.is24HourFormat
                  ? ""
                  : _dateTime.hour <= 12 ? "AM" : "PM",
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.model.location,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: MediaQuery.of(context).size.width / 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: WeatherInfo(
              condition: widget.model.weatherCondition,
              unit: widget.model.unitString,
              temperature: widget.model.temperature.toString(),
              low: widget.model.low.toString(),
              high: widget.model.high.toString(),
            ),
          )
        ],
      ),
    );
  }
}
