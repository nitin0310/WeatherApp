import 'package:flutter/material.dart';
import 'package:weather/CityData.dart';

class ForeCastData extends StatefulWidget {
  @override
  _ForeCastDataState createState() => _ForeCastDataState();
}

class _ForeCastDataState extends State<ForeCastData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10.0,right: 10.0),
      padding: EdgeInsets.only(top: 15.0,left: 10.0),
      
      width: MediaQuery.of(context).size.width,
      height: 180.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.indigo[900],Colors.indigo[500]],begin: Alignment.topLeft,end: Alignment.bottomRight),
        boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(0.0, 0.0),blurRadius: 15.0,spreadRadius: 2.0)],
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 30.0,width: 100,
            child: Center(child: Text("${CityData.foreCastDate1}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
            decoration: BoxDecoration(
            color: Colors.deepOrange[300],
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              boxShadow: [BoxShadow(color: Colors.deepOrange[200],offset: Offset(0, 0),blurRadius: 5.0)]
            ),
          ),
          SizedBox(height: 10.0,),

          Flexible(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [
                    SizedBox(width: 10.0,),
                    CircleAvatar(radius: 3.0,backgroundColor: Colors.deepOrange[200],),
                    SizedBox(width: 10.0,),
                    Row(
                      children: [
                        Text("Sunrise : ",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                        Text(CityData.sunrise1==null?" ":"${CityData.sunrise1}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300,color: Colors.white),),
                      ],
                    ),
                  ],),
                  Row(
                    children: [
                      SizedBox(width: 10.0,),
                      CircleAvatar(radius: 3.0,backgroundColor: Colors.deepOrange[200],),
                      SizedBox(width: 10.0,),
                      Row(
                        children: [
                          Text("Sunset : ",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                          Text(CityData.sunset1==null?" ":"${CityData.sunset1}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300,color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10.0,),
                      CircleAvatar(radius: 3.0,backgroundColor: Colors.deepOrange[200],),
                      SizedBox(width: 10.0,),
                      Row(
                        children: [
                          Text("Moonrise : ",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                          Text(CityData.moonrise1==null?" ":"${CityData.moonrise1}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300,color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10.0,),
                      CircleAvatar(radius: 3.0,backgroundColor: Colors.deepOrange[200],),
                      SizedBox(width: 10.0,),
                      Row(
                        children: [
                          Text("Moonset : ",style: TextStyle(fontSize: 20.0,color: Colors.white),),
                          Text(CityData.moonset1==null?" ":"${CityData.moonset1}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300,color: Colors.white),),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}
