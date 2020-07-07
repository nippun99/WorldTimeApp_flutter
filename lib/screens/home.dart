import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
//rec data through arguments from modal route
  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty? data:ModalRoute.of(context).settings.arguments;
    print(data);
    Color bgcolor= data['isDay']? Colors.blueAccent:Colors.grey[500];
    return Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text('World Time',style: TextStyle(fontFamily: 'Oleo')),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
          child: Center(
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                onPressed: ()async {
                    dynamic result= await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data=result;
                    });
                  }, 
                icon: Icon(Icons.location_on),
                label: Text('Choose Location',style: TextStyle(fontFamily:'Oleo'),),
                ),
                SizedBox(height: 30),
                Text(data['location'],
                style:TextStyle(
                  fontFamily: 'Oleo',
                  fontSize: 30,

                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,

                )
                ),
                SizedBox(height:20),
                Text(data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    letterSpacing:3,
                  ),
                )
              ],
            ),
          ),
        ),
        );
  }
}