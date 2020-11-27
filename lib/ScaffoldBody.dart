import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/AnalyticsData.dart';
import 'package:weather/CityData.dart';
import 'package:http/http.dart' as http;
import 'package:weather/ForeCastData.dart';
import 'package:weather/ForeCastData2.dart';


class ScaffoldBody extends StatefulWidget {
  
  @override
  _ScaffoldBodyState createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {

  String temperature="";

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black87,), onPressed: ()=>Navigator.pop(context)),
          actions: [IconButton(icon: Icon(Icons.notifications,color: Colors.black45,), onPressed: (){})],
          centerTitle: true,
          title: Text("${CityData.citySelected}",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w300,color: Colors.black),),
          backgroundColor: Colors.white,),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      color: Colors.indigo,
                      boxShadow: [
                        BoxShadow(color: Colors.blueAccent[100],offset: Offset(0, 0),spreadRadius: 5.0,blurRadius: 20.0)
                      ]
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 70.0,
                        width: 130.0,


                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("$temperature",style: TextStyle(fontSize: 40.0,color: Colors.white),)
                              ],
                            ),
                            Column(
                              children: [
                                Text("0",style: TextStyle(fontSize: 18.0,color: Colors.white),)
                              ],
                            ),
                            Column(
                              children: [
                                Text("C",style: TextStyle(fontSize: 40.0,color: Colors.white),)
                              ],
                            )
                          ],
                        ),

                      ),
                    )
                  ),


                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 35.0,left: 15.0,bottom: 5.0),
                child: Row(
                  children: [
                    Text("Analytics",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: 18.0),),
                    SizedBox(width: 15.0,),
                    Icon(Icons.compare_arrows,color: Colors.black54,size: 20.0,),
                    Spacer(),
                    Container(
                      child: Center(child: Text("wind dir.",style: TextStyle(color: Colors.white,fontSize: 13.0),)),
                      margin: EdgeInsets.only(right: 10.0),
                      height: 25.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange[300],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                    )
                  ],
                ),
              ),

              AnalyticsData(),

              Container(
                margin: EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0),
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      width: 190.0,
                      child: Flexible(
                        child: Text("Check for Real-Time Historic Data",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w500),),
                      ),
                    ),

                    Spacer(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40.0,width: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Center(child: IconButton(icon: Icon(Icons.navigate_next,color: Colors.white,), onPressed: (){}),),
                      )
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0,left: 15.0,bottom: 5.0),
                child: Row(
                  children: [
                    Text("Weather forecast",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: 18.0),),
                    SizedBox(width: 15.0,),
                    Icon(Icons.wifi_tethering,color: Colors.black54,size: 16.0,),

                  ],
                ),
              ),

              ForeCastData(),

              ForeCastData2(),

            ],
          ),
        )
      ),
    );
  }

  Future<String> fetchWeatherData() async {
    var response = await http.get(Uri.encodeFull("http://api.weatherstack.com/current?access_key=678873cccaedc50cb3f2f73dffcff416&query=${CityData.citySelected}"));
    var data=json.decode(response.body);

    setState(() {
      this.temperature=data["current"]["temperature"].toString();
      CityData.humidity=data["current"]["humidity"].toString();
      CityData.cloudCover=data["current"]["cloudcover"].toString();
      CityData.windSpeed=data["current"]["wind_speed"].toString();
      CityData.isDay=data["current"]["is_day"].toString();
    });
    
    var responseForcast=await http.get(Uri.decodeFull("http://api.weatherapi.com/v1/forecast.json?key=ea48fb95a73145a6bde65333203008&q=${CityData.citySelected}&days=2"));
    var forecastData=json.decode(responseForcast.body);

    print(forecastData["forecast"]["forecastday"][0]["date"]);
    setState(() {
      CityData.foreCastDate1=forecastData["forecast"]["forecastday"][0]["date"];
      CityData.sunrise1=forecastData["forecast"]["forecastday"][0]["astro"]["sunrise"];
      CityData.sunset1=forecastData["forecast"]["forecastday"][0]["astro"]["sunset"];
      CityData.moonrise1=forecastData["forecast"]["forecastday"][0]["astro"]["moonrise"];
      CityData.moonset1=forecastData["forecast"]["forecastday"][0]["astro"]["moonset"];

      CityData.foreCastDate2=forecastData["forecast"]["forecastday"][1]["date"];
      CityData.sunrise2=forecastData["forecast"]["forecastday"][1]["astro"]["sunrise"];
      CityData.sunset2=forecastData["forecast"]["forecastday"][1]["astro"]["sunset"];
      CityData.moonrise2=forecastData["forecast"]["forecastday"][1]["astro"]["moonrise"];
      CityData.moonset2=forecastData["forecast"]["forecastday"][1]["astro"]["moonset"];

    });
  }
}
