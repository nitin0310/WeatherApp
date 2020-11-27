import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:weather/CityData.dart';
import 'package:weather/ScaffoldBody.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  String receivedCountry="";
  String receivedState="";
  String receivedCity="";
  List countries=List();
  List states=List();
  List cities=List();


  @override
  void initState() {
    super.initState();
    getCountries();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(78, 93, 114, 0.7),
      
      floatingActionButton: receivedCity==""?FloatingActionButton.extended(
        onPressed: (){},
        backgroundColor: Colors.orange[200],
        elevation: 0.0,
        label: Row(
          children: [
            Text("Check",style: TextStyle(color: Colors.white),),
            Icon(Icons.navigate_next,color: Colors.white,)
          ],
        ),
      ):
      FloatingActionButton.extended(
        onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>ScaffoldBody())),
        backgroundColor: Colors.orange[400],
        elevation: 0.0,
        label: Row(
          children: [
            Text("Check",style: TextStyle(color: Colors.white),),
            Icon(Icons.navigate_next,color: Colors.white,)
          ],
        ),
      ),

      body: Column(
        children: [
          SizedBox(height:80.0),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 160.0,
              width: 160.0,
              decoration: BoxDecoration(
                color: Colors.indigo,
                image: DecorationImage(image: AssetImage("images/dashboardImage.png")),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,0),
                    color: receivedCountry==""?Colors.orange[300]:receivedState==""?Colors.green[300]:Colors.blue[300],
                    blurRadius:30.0,
                    spreadRadius: 9.0
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                )
              ),
            ),
          ),

          SizedBox(height: 200.0,),

          Container(
            margin: EdgeInsets.only(left: 20.0,right: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
              color: Colors.white70,
            ),
            height: 300.0,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                height: 250.0,
                width: 280.0,
                child: countries==null?CircularProgressIndicator()
                    :Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0,0),
                              color: Colors.orange[100],
                              blurRadius:10.0,
                              spreadRadius: 0.0
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(7.0),
                      child: DropdownButton(
                        isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: receivedCountry==""?
                          Text("Select Country",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),):Text("--- done ---",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10.0,bottom: 7.0),
                          child: receivedCountry==""?Icon(Icons.arrow_downward):Icon(Icons.check_circle_outline,color: Colors.green,),
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.indigo),
                        onChanged: (String newValue) {
                          setState(() {
                            receivedCountry = newValue;
                            print(receivedCountry);
                            getStates();
                          });
                        },
                        items: countries.map((entry) {
                          return DropdownMenuItem(
                            child: Text(entry['name']),
                            value: entry['id'].toString(),
                          );
                        }).toList(),
                      ),
                    ),

                    states==null?Container()
                        :Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0,0),
                              color: Colors.orange[100],
                              blurRadius:10,
                              spreadRadius: 0.0
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(7.0),
                      child: DropdownButton(
                        isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: receivedState==""?
                          Text("Select State",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),):Text("--- done ---",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10.0,bottom: 7.0),
                          child: receivedState==""?Icon(Icons.arrow_downward):Icon(Icons.check_circle_outline,color: Colors.green,),
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.indigo),
                        onChanged: (String newValue) {
                          setState(() {
                            receivedState = newValue;
                            print(receivedState);
                            getCities();
                          });
                        },
                        items: states.map((entry) {
                          return DropdownMenuItem(
                            child: Text(entry.toString()),
                            value: entry.toString(),
                          );
                        }).toList(),
                      ),
                    ),

                    cities==null?Container()
                        :Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0,0),
                              color: Colors.orange[100],
                              blurRadius:10.0,
                              spreadRadius: 0.0
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(7.0),
                      child: DropdownButton(
                        isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: receivedCity==""?Text("Select City",style: TextStyle(fontWeight: FontWeight.bold),):Text("--- done ---",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10.0,bottom: 7.0),
                          child: receivedCity==""?Icon(Icons.arrow_downward):Icon(Icons.check_circle_outline,color: Colors.green,),
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.indigo),
                        onChanged: (String newValue) {
                          setState(() {
                            receivedCity = newValue;
                            print(receivedCity);
                            CityData.citySelected=receivedCity;
                          });
                        },
                        items: cities.map((entry) {
                          return DropdownMenuItem(
                            child: Text(entry.toString()),
                            value: entry.toString(),
                          );
                        }).toList(),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List> getCountries() async {
    var response = await http.get(Uri.encodeFull("https://raw.githubusercontent.com/harpreetkhalsagtbit/country-state-city/master/lib/country.json"));
    var data = json.decode(response.body);
//    print(data);
    List results = data;
    setState(() {
      countries=results;
    });

  }

  Future<List> getStates() async {
    var response = await http.get(Uri.encodeFull("https://raw.githubusercontent.com/harpreetkhalsagtbit/country-state-city/master/lib/state.json"));
    var data = json.decode(response.body);
    List results = data;
    List stateList=List();
    int index=0;
    for(int i=0;i<results.length;i++){
      if(results[i]["country_id"]==receivedCountry){
        stateList.add(results[i]["name"]);
      }
    }

    setState(() {
      states=stateList;
    });
//    print(states);
  }

  Future<List> getCities() async{
    var response = await http.get(Uri.encodeFull("https://raw.githubusercontent.com/harpreetkhalsagtbit/country-state-city/master/lib/state.json"));
    var data = json.decode(response.body);
    List results = data;
    String stateId="";

    for(int i=0;i<results.length;i++){
      if(results[i]["name"]==receivedState){
        stateId=results[i]["id"];
      }
    }
    var response2 = await http.get(Uri.encodeFull("https://raw.githubusercontent.com/harpreetkhalsagtbit/country-state-city/master/lib/city.json"));
    var data2 = json.decode(response2.body);
    List citydata=List();
    List results2 = data2;
    for(int i=0;i<results2.length;i++){
      if(results2[i]["state_id"]==stateId){
        citydata.add(results2[i]["name"]);
      }
    }
    setState(() {
      cities=citydata;
    });
    print(citydata);
  }
}

//country - https://raw.githubusercontent.com/harpreetkhalsagtbit/country-state-city/master/lib/country.json
//state - https://raw.githubusercontent.com/harpreetkhalsagtbit/country-state-city/master/lib/state.json
//city - https://raw.githubusercontent.com/harpreetkhalsagtbit/country-state-city/master/lib/city.json