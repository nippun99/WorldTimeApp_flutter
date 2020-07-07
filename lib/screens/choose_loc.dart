import 'package:flutter/material.dart';
import 'package:world_time/screens/services/time_service.dart';

class ChooseLoc extends StatefulWidget {
  ChooseLoc({Key key}) : super(key: key);

  @override
  _ChooseLocState createState() => _ChooseLocState();
}

class _ChooseLocState extends State<ChooseLoc> {
  List<TimeService> loc =[
    TimeService(location:'Berlin',flag:'germany.png',url:'Europe/Berlin'),
    TimeService(location:'Kolkata',flag:'india.png',url:'Asia/Kolkata'),
    TimeService(location:'London',flag:'uk.png',url:'Europe/London'),
  ];

  void updateTime(index) async{
    TimeService inst=loc[index];
    await inst.getTime();
    Navigator.pop(context,{
        'location': inst.location,
        'flag':inst.flag,
        'time':inst.time,
        'isDay':inst.isDay
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text('Loaction Choose',style: TextStyle(fontFamily: 'Oleo')),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: loc.length,
        itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            onTap: (){
                updateTime(index);
            },
            title:Text(loc[index].location)
          )
        ) ;
       },
      ),
    );
  }
}