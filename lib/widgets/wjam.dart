import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:core';
import 'package:to_do_list/shared/theme.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  ClockWidgetState createState() => ClockWidgetState();
}

class ClockWidgetState extends State<ClockWidget> {
  late String _timeString;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timeString = _getTimeString();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeString = _getTimeString();
      });
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  String _getTimeString() {
    DateTime now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _timeString,
      style: blackTextStyle.copyWith(fontSize: 50, fontWeight: semiBold),
    );
  }
}
