import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foot_man/Data/database.dart';
import 'package:foot_man/Business/add_event.dart';
import 'package:foot_man/Presentation/event_views.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DatabaseService _db = DatabaseService();
  Color secondaryColor = Color(0xffFBD83C);
  Color primaryColor = Color(0xff0e0e0e);
  CalendarController _calendarController= new CalendarController();


  CollectionReference _event = FirebaseFirestore.instance.collection('events');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: secondaryColor,
        title: new Text('Calendar',
        style: TextStyle(color: Colors.black, fontSize: 20)),
    ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(8.0),
                child: TableCalendar(
                    calendarController: _calendarController,
                ),

            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Text(
                'List of events',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: size.width,
              height: size.height,
              //color: Colors.redAccent,
              child: StreamBuilder<QuerySnapshot>(
                stream: _event.snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                  Widget child =   Container();
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(80.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: new AlwaysStoppedAnimation<Color>(
                              Colors.lightGreen,
                            ),
                          ),
                        ),
                      );
                    }

                    return ListView(
                      physics: ClampingScrollPhysics(),
                      children: snapshot.data.docs.map((DocumentSnapshot doc){
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30)
                            )
                          ),
                          child: GestureDetector(
                            child: ListTile(
                              leading: IconButton(
                                icon: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red,
                                ),
                                iconSize: 20,
                                onPressed: (){
                                  print(doc.reference.id);
                                  _db.deleteEvent(doc.reference.id);
                                  //Create a delete function in databaseServices and call it here
                                },
                              ),
                              subtitle: Text(
                                '${doc.data()['title']}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              title: Text(
                                '${doc.data()['date']}',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.greenAccent ,
                                ),
                                iconSize: 20,
                                onPressed: (){
                                  _db.deleteEvent(doc.reference.id);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddEvent()));
                                  //Create a delete function in databaseServices and call it here
                                },
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) =>
                                  EventViews(title: '${doc.data()['title']}',
                                    description: '${doc.data()['description']}',
                                    date: '${doc.data()['date']}',
                                  )));
                            },
                          ),
                        );
                      }).toList(),
                   );
                  }
              ),
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEvent()));
        },
      ),
    );
  }
}
