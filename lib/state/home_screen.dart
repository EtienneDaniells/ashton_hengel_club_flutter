import 'package:ashton_hengel_club/global/colors.dart';
import 'package:ashton_hengel_club/widgets/capsule_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  DateTime _selectedDay;
  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  List _selectedEvents;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _events = {
      DateTime(2019, 05, 12): ['5 Spesie', 'Event B0', 'Event C0'],
      DateTime(2019, 05, 19): ['Event A1'],
      DateTime(2019, 05, 26): ['Event A2', 'Event B2', 'Event C2', 'Event D2'],      
      DateTime(2019, 05, 23): ['New Event'],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _visibleEvents = _events;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _controller.forward();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      _visibleEvents = Map.fromEntries(
        _events.entries.where(
          (entry) =>
              entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );
    });
  }

  Widget _buildCalendar() {
    return TableCalendar(
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: Colors.black, fontSize: 16),
        weekendStyle: TextStyle(color: Colors.black, fontSize: 16),
      ),
      locale: 'en_US',
      events: _visibleEvents,
      initialCalendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        outsideWeekendStyle: TextStyle(color: SECONDARY_COLOR),
        outsideStyle: TextStyle(color: SECONDARY_COLOR),
        weekdayStyle: TextStyle(color: SECONDARY_COLOR),
        weekendStyle: TextStyle(color: SECONDARY_COLOR),
        selectedColor: PRIMARY_COLOR,
        todayColor: null,
        markersColor: BACKGROUND_COLOR,
      ),
      headerStyle: HeaderStyle(
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 30,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: Colors.black,
          size: 30,
        ),
        centerHeaderTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
        formatButtonVisible: false,
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Padding(
            padding: EdgeInsets.only(top: 10),
            child: CapsuleButton(
                "$event",
                textStyle: TextStyle(color: PRIMARY_COLOR, fontSize: 18),
                height: 40,
                width: 250,
                alignment: Alignment.center,
                backgroundColor: Colors.grey[350],
                borderColor: PRIMARY_COLOR,
                onTap: () {
                  print("$event Tapped");
                },
              ),
          ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: Colors.white.withOpacity(0.5),
            child: _buildCalendar(),
          ),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }
}
