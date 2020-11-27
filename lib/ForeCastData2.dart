import 'package:flutter/material.dart';
import 'package:weather/CityData.dart';

class ForeCastData2 extends StatefulWidget {
  @override
  _ForeCastData2State createState() => _ForeCastData2State();
}

class _ForeCastData2State extends State<ForeCastData2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
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
            child: Center(child: Text("${CityData.foreCastDate2}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
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
                        Text(CityData.sunrise2==null?" ":"${CityData.sunrise2}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300,color: Colors.white),),
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
                          Text(CityData.sunset2==null?" ":"${CityData.sunset2}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300,color: Colors.white),),
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
                          Text(CityData.moonrise2==null?" ":"${CityData.moonrise2}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300,color: Colors.white),),
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
                          Text(CityData.moonset2==null?" ":"${CityData.moonset2}",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w300,color: Colors.white),),
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
