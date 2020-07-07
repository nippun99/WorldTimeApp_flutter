import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


//jab bhi api call karni hai service bana ke karo
class TimeService {
  String location;
  String time;
  String flag;
  String url;
  bool isDay;

  TimeService({this.location,this.flag,this.url});

  Future<void> getTime() async{
    Response resp= await get('http://worldtimeapi.org/api/timezone/$url');
    Map data= jsonDecode(resp.body);
    DateTime now= DateTime.parse(data['datetime']);
    String offset=data['utc_offset'].substring(1,3) ;
    now=now.add(Duration(hours:int.parse(offset)));
    time=DateFormat.jm().format(now);
    isDay=now.hour>6 && now.hour<20 ? true:false;

  }

  
}