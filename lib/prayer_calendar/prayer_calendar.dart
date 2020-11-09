//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0

import 'package:dzemaat/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';

// Example holidays
final Map<DateTime, List> holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

class PrayerCalendar extends StatefulWidget {
  PrayerCalendar({
    Key key,
  }) : super(key: key);

  @override
  _PrayerCalendarState createState() => _PrayerCalendarState();
}

class _PrayerCalendarState extends State<PrayerCalendar>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.black,
        ),
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'images/bg.png',
              ),
            )),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: ListTile(
                    leading: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => HomeScreen(),
                        ),
                      );},
                    ),
                    title: Text(
                      'Prayer Times',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  height: 40,
                ),
                _buildTableCalendar(),
                SizedBox(height: 8.0),
                SizedBox(height: 8.0),
                Expanded(
                  child: _buildEventList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      // holidays: _holidays,
      // startingDayOfWeek: StartingDayOfWeek.friday,

      calendarStyle: CalendarStyle(
        selectedColor: Colors.green,
        todayColor: Colors.transparent,
        markersColor: Colors.white,
      ),
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: [
        listTileContainer(
          time: '05:16 AM',
          event: 'Amsak',
        ),
        listTileContainer(
          time: '05:30 AM',
          event: 'Al-Faler prayer',
        ),
        listTileContainer(
          time: '06:47',
          event: 'Sunrise',
        ),
        listTileContainer(
          time: '12:22',
          event: 'Noor El Zohar',
        ),
        listTileContainer(
          time: '03:16 PM',
          event: 'ElAsr',
        ),
        listTileContainer(
          time: '05:58 PM',
          event: 'Sunset',
        ),
        listTileContainer(
          time: '05:58 PM',
          event: 'AlMaghreeb Prayer',
        ),
        listTileContainer(
          time: '07:14',
          event: 'El-eshaa Prayer',
        ),
      ],
    );
  }
}

  Widget listTileContainer({var event, String time}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(12.0),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    child: Column(
      children: [
        ListTile(
          title: Text(
            event.toString(),
            style: TextStyle(color: Colors.white),
          ),
          trailing: Text(
            time,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () => print('$event tapped!'),
        ),
      ],
    ),
  );
}
