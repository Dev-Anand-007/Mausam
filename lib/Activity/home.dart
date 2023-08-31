import 'dart:math';
import 'package:weather_icons/weather_icons.dart';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller= new TextEditingController();
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? info =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String? temp = ((info?['temp_val'] as String?).toString());
    if(temp!="NA"){
      temp=temp.substring(0,4);
    }
    final String? des = ((info?["Des_val"] as String?).toString());
    String? airSpeed = ((info?["airSpeedVal"] as String?).toString());
    print(airSpeed);
    if(airSpeed!="NA"){
      airSpeed=airSpeed.substring(0,3);

    }
    final String? humidity=((info?["humidity_val"] as String?).toString());
    final String? icon_data=(info?["icon"] as String?);
    final String? city_detail=(info?["city"] as String?);



    var city_name = [
      "Mumbai",
      "Delhi",
      "Chennai",
      "Kolkata ",
      "Indore",
      "Bardhaman"
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.red,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.3,
                    0.9
                  ],
                  colors: [
                    Colors.blue,
                    Colors.pinkAccent,
                  ]),
            ),
            child: Column(

              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/loading",arguments: {
                            "search":searchcontroller.text,
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Icon(
                              Icons.search,
                              color: Colors.blue,
                            )),
                      ),
                      Expanded(
                          child: TextField(
                            controller: searchcontroller,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,
                          hintText: "Search $city",
                        ),
                      ))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        child: Row(
                          children: [
                              Image.network('https://openweathermap.org/img/wn/$icon_data@2x.png'),
                            Column(

                              children: [
                                Text("$des",style:TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                                Text("$city_detail",style:TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ))
                              ],
                            ),
                            
                          ],
                        )
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.thermostat),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text("$temp", style: TextStyle(
                                  fontSize: 90,),),
                                Text("C",style: TextStyle(
                                  fontSize: 30,),)

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                        child: Column(

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.strong_wind),
                              ],
                            ),
                            SizedBox(height: 30,),


                            Text("$airSpeed", style: TextStyle(
                              fontSize: 50,
                            ),),
                            Text("Km/hr", style: TextStyle(
                              fontSize: 20,
                            ),),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.fromLTRB(10, 10, 25, 10),
                        child: Column(

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(height: 30,),


                            Text("$humidity", style: TextStyle(
                              fontSize: 50,
                            ),),
                            Text("%", style: TextStyle(
                              fontSize: 20,
                            ),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 60,),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [Text("Made by Anand"), Text("OpenWeather.API")],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
