import 'package:ashton_hengel_club/global/colors.dart';
import 'package:ashton_hengel_club/widgets/capsule_button.dart';
import 'package:ashton_hengel_club/model/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _sponsorsController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  List<String> _sponsers = [];
  DateTime _date;

  @override
  void initState() {
    _date = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day);
    _dateController.text = _date.toString();
    super.initState();
  }

  @override
  void dispose() {
    _eventNameController?.dispose();
    _descriptionController?.dispose();
    _locationController?.dispose();
    _sponsorsController?.dispose();
    super.dispose();
  }

  void _createEvent() async {
    _sponsers.add(_sponsorsController.text);
    Event _event = Event(
      '',
      name: _eventNameController.text,
      description: _descriptionController.text,
      location: _locationController.text,
      active: true,
      sponsors: _sponsers,
      date: _date,
    );

    await Firestore.instance
        .collection(_event.collectionName)
        .add(_event.toMap());
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _date)
      setState(() {
        _date = DateTime.utc(picked.year, picked.month, picked.day);
        _dateController.text = _date.toString();
      });
  }

  Widget textField(String title, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: SECONDARY_COLOR),
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyle(color: SECONDARY_COLOR),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: SECONDARY_COLOR)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: SECONDARY_COLOR)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text('CREATE EVENT'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            textField('Event Name', _eventNameController),
            textField('Description', _descriptionController),
            textField('Location', _locationController),
            textField('Sponsors', _sponsorsController),
            InkWell(
              onTap: () => _selectDate(context),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: TextField(
                controller: _dateController,
                style: TextStyle(color: SECONDARY_COLOR),
                decoration: InputDecoration(
                  labelText: 'Date',
                  labelStyle: TextStyle(color: SECONDARY_COLOR),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: SECONDARY_COLOR)),
                ),
                enabled: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CapsuleButton(
                'CREATE EVENT',
                onTap: () => _createEvent(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
