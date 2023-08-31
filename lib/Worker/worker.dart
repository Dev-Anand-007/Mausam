import 'package:http/http.dart';
import 'dart:convert';

class worker
{
  String location;

  worker({this.location=""}){

    location=this.location;

  }

  late String temp;
  late String humidity;
  late String air_Speed;
  late String description;
  late String main;
  late String icon_data;

  //method

  Future<void> getData() async
  {
    try{
  Uri url = Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$location&appid=0c0131292a8ee9612af8b467d767f7d4");
  Response response = await get(url);
  Map data = jsonDecode(response.body);


  //getting temp,humidity
  Map temp_data=data["main"];
  double getTemp=temp_data["temp"]-273.15;
  Map wind_data=data["wind"];
  double getWindSpeed=wind_data["speed"]*3.6;
  String getHumidity=temp_data["humidity"].toString();
  String icon=data['weather'][0]['icon'].toString();



  //getting Description
  List weather_data = data['weather'];
  Map weather_main_data = weather_data[0];
  String getMainDes=weather_main_data['main'];
  String getDesc=weather_main_data["description"];

  //assigning values
  temp=getTemp.toString();
  humidity=getHumidity;
  air_Speed=getWindSpeed.toString();
  description=getDesc;
  main = getMainDes;
  icon_data=icon;


  }catch (e){
      temp="NA";
      humidity="NA";
      air_Speed="NA";
      description="Can't find City.";
      main = "NA";
      icon_data="09d";
    }


  }



}


