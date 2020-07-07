import 'package:flutter/material.dart';
import 'package:world_time/screens/services/time_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

//service ka instance bano fn ke through aur usse initstatre mein call karo 
//send data to home using arguments
class _LoadingState extends State<Loading> {
  void setupTime() async{

    TimeService inst= TimeService(location:'Berlin',flag:'germany.png',url:'Europe/Berlin');
    await inst.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location': inst.location,
        'flag':inst.flag,
        'time':inst.time,
        'isDay':inst.isDay
      });
  
      
    }

  @override
  void initState() { 
    
    setupTime();

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
                color: Colors.grey[900],
                size: 50.0,
              )
      )
    );
  }
}