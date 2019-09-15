import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String collectionName = 'events';
  final String id;
  final DocumentReference ref;
  final bool active;

  final String name;
  final DateTime date;
  final List<String> sponsors;
  final String description;
  final DateTime linesIn;
  final DateTime weighIn;
  final String location;

  final Timestamp createdOn;
  final DocumentReference createdBy;
  final Timestamp updatedOn;
  final DocumentReference updatedBy;

  Event(this.id,
      {this.ref,
      this.active,
      this.name,
      this.date,
      this.description,
      this.createdOn,
      this.updatedOn,
      this.createdBy,
      this.updatedBy,
      this.sponsors,
      this.linesIn,
      this.weighIn,
      this.location});

  factory Event.fromSnapshot(DocumentSnapshot snapshot) {
    return Event(snapshot.documentID,
        ref: snapshot.reference, 
        active: snapshot.data['Active'],
        name: snapshot.data['Name'],
        date: snapshot.data['Date'],
        description: snapshot.data['Description'],
        sponsors: snapshot.data['Sponsors'],
        linesIn: snapshot.data['Lines In'],
        weighIn: snapshot.data['Weigh In'],
        location: snapshot.data['Location'],
        createdOn: snapshot.data['Created On'],
        updatedOn: snapshot.data['Updated On'],
        createdBy: snapshot.data['Created By'],
        updatedBy: snapshot.data['Updated By'],
        );
  }

  Map<String, dynamic> toMap(){
    return {
      'Active' : active,
      'Created On' : createdOn,
      'Created By' : createdBy,
      'Updated On' : updatedOn,
      'Updated By' : updatedBy,
      'Name' : name,
      'Date' : date,
      'Description' : description,
      'Sponsors' : sponsors,
      'Lines In' : linesIn,
      'Weight In' : weighIn,
      'Location' : location,
    };
  }
}
