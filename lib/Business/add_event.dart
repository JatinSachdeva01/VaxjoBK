import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:foot_man/Data/database.dart';

import 'package:foot_man/Business/calendar_screen.dart';


class AddEvent extends StatefulWidget {

  final DateTime  selectedDate;

  const AddEvent({Key key, this.selectedDate}) : super(key: key);

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  DatabaseService _db = DatabaseService();
  final _key = GlobalKey<FormBuilderState>();

  String _date = " ";

  Color secondaryColor = Color(0xffFBD83C);
  Color primaryColor = Color(0xff0e0e0e);

  TextEditingController _title, _details;
  final DateTime _firstDate = DateTime(1800);
  DateTime _thisDate = DateTime.now();
  final DateTime _lastDate = DateTime(2025);
  @override
  void initState() {
    _title = TextEditingController();
    _details = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: secondaryColor,
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () async{
                _key.currentState.save();
                await _db.logEvent(_title.text, _details.text, _date);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CalendarScreen()));
              },
              child: Text('Save'),
            ),
          )
        ],
        title: new Text('Add Event',
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FormBuilder(
            key: _key,
              child: Column(
            children: [
              FormBuilderTextField(
                controller: _title,
                name: 'Title',
                decoration: InputDecoration(
                  hintText: 'Add Title',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 48.0),
                ),
              ),
              Divider(),
              FormBuilderTextField(
                controller: _details,
                name: 'Description',
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: 'Add Details',
                  prefixIcon: Icon(Icons.short_text),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 48.0),
                ),
              ),
              Divider(),
              IconButton(
                icon: Icon(
                    Icons.calendar_today_rounded
                ),
                iconSize: 28,
                onPressed: ()async {
                  await showDatePicker(context: context, initialDate: _thisDate,
                      firstDate: _firstDate, lastDate: _lastDate).then((date){
                    setState(() {
                      _date = "${date.day}/${date.month}/${date.year}";
                    });
                    print(_date);
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
