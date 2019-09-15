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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _eventNameController?.dispose();
    _descriptionController?.dispose();
    _locationController?.dispose();
    super.dispose();
  }

  void _createEvent() async {
    Event _event = Event(
      '',
      name: _eventNameController.text,
      description: _descriptionController.text,
      location: _locationController.text,
      active: true,
      sponsers: [],
    );

    await Firestore.instance.collection(_event.collectionName).add(_event.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CREATE EVENT'),),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: _eventNameController,
            decoration: InputDecoration(labelText: 'Event Name'),
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(labelText: 'Location'),
          ),
          CapsuleButton('CREATE EVENT', onTap:() =>  _createEvent(),)
        ],
      ),
    );
  }
}