import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam/Worker/worker.dart';


class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

String city="Mumbai";
late String temp;
late String humidity;
late String air_Speed;
late String des;
late String main;
late String icon;
late String searchData;
  void startApp() async{
    worker instance= worker(location: city);
    await instance.getData();
    temp=instance.temp;
    humidity=instance.humidity;
    air_Speed=instance.air_Speed;
    des=instance.description;
    main=instance.main;
    icon=instance.icon_data;

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context , '/home', arguments: {
        "temp_val":temp,
        "humidity_val":humidity,
        "airSpeedVal":air_Speed,
        "Des_val":des,
        "main_val":main,
        "icon":icon,
        "city":city,
      });
    });



  }




  @override
  void initState() {
    // TODO: implement initState

    super.initState();


  }
  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic>? search =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if(search?.isNotEmpty ?? false){
      city=search?["search"];

    }





    startApp();


    return Scaffold(
      body:SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/Weather.png", height: 240, width: 240,),
            Text("Mausam",style: TextStyle(
              fontSize:40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),SizedBox(height: 15,),
            Text("~Anand", style: TextStyle(
              color: Colors.white,
            ),),
            SizedBox(height: 20,),
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),

          ],
        ),
      ),
      backgroundColor: Colors.lightBlue,
      );

  }
}
