import 'package:flutter/material.dart';
import 'package:weather/CityData.dart';

class AnalyticsData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(

          children: [
            //======================================================
            Container(
              margin: EdgeInsets.only(left: 15.0),
              height: 150,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.indigo,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          color: Colors.black54
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.indigo[400],
                    ),
                    child: Icon(Icons.beach_access,color: Colors.white,),
                  ),
                  Text("Humidity",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12.0),),
                  Text(CityData.humidity==null?" ":"${CityData.humidity}",style: TextStyle(color: Colors.white,fontSize: 25.0),)
                ]
              ),
            ),
            //======================================================
            Container(
              margin: EdgeInsets.only(left: 15.0),
              height: 150,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.indigo[200],
                    offset: Offset(0.0, 0.0),
                    blurRadius: 20.0,
                  )
                ]
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              color: Colors.orange[100]
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.deepOrange[200],
                      ),
                      child: Icon(Icons.cloud,color: Colors.white,),
                    ),
                    Text("Cloud Cover",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w300,fontSize: 12.0),),
                    Text(CityData.cloudCover==null?" ":"${CityData.cloudCover}",style: TextStyle(color: Colors.black54,fontSize: 25.0),)
                  ],
                ),
            ),
            //======================================================
            Container(
              margin: EdgeInsets.only(left: 15.0),
              height: 150,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.indigo,
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              color: Colors.black54
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.indigo[400],
                      ),
                      child: Icon(Icons.ac_unit,color: Colors.white,),
                    ),
                    Text("Wind Speed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 12.0),),
                    Text(CityData.windSpeed==null?" ":"${CityData.windSpeed}",style: TextStyle(color: Colors.white,fontSize: 25.0),)
                  ],
                ),
            ),
            //======================================================
            Container(
              margin: EdgeInsets.only(left: 15.0),
              height: 150,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo[200],
                      offset: Offset(0.0, 0.0),
                      blurRadius: 20.0,
                    )
                  ]
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              color: Colors.orange[200]
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.deepOrange[200],
                      ),
                      child: Icon(Icons.flare,color: Colors.white,),
                    ),
                    Text("Is Day!",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w300,fontSize: 12.0),),
                    Text(CityData.isDay==null?" ":"${CityData.isDay}",style: TextStyle(color: Colors.black54,fontSize: 22.0),)
                  ],
                ),
            ),

            SizedBox(width: 20.0,)


          ],
        ),
      ),
    );
  }
}
