import 'package:climaapp/screens/city_screen.dart';
import 'package:climaapp/services/weather.dart';
import 'package:climaapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  var tempo;
  int temp;
  String country;
  String description;
  String weatherIcon;
  String cityName;
  var tempmin;
  var humidity;
  int humidity1;
  var tempmax;
  var sunrise;
  var sunset;
  var description1;
  String formatted;
  String formatted1;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
    print(tempo);
  }

  void updateUI(dynamic weatherData) {
    country = weatherData['sys']['country'];
    tempo = weatherData['main']['temp'];
    temp = tempo.toInt();
    description = weatherData['weather'][0]['description'];
    description1 = weatherData['weather'][0]['main'];
    cityName = weatherData['name'];
    humidity = weatherData['main']['humidity'];
    humidity1=humidity.toInt();
    tempmin = weatherData['main']['temp_min'];
    tempmax = weatherData['main']['temp_max'];
    sunrise= weatherData['main']['pressure'];
    sunset= weatherData['sys']['sunset'];
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(
        child:Text("$cityName",style: TextStyle(color: Colors.black,fontSize: 24.0),
        textAlign: TextAlign.center,),
        ),
       backgroundColor: Colors.white,
       leading:  FlatButton(
         onPressed: () async{
           var weatherData =await weather.getLocationWeather();
           updateUI(weatherData);
         },
         child: Icon(
           Icons.near_me,
           color: Colors.black,
           size: 30.0,
         ),
       ),
        actions:<Widget>[
          FlatButton(
          onPressed: () async {
          var typedName = await Navigator.push(
           context,
       MaterialPageRoute(
            builder: (context) {
            return CityScreen();
    },
    ),
    );
    if (typedName != null) {
    var weatherData =
    await weather.getCityWeather(typedName);
    updateUI(weatherData);
    }
    },
          child: Icon(
            Icons.location_city,
            size: 30.0,
            color: Colors.black,
          ),
        ),
        ],
      ),


      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child:
          SafeArea(

          child:

          Column(

            children: <Widget>[
              SizedBox(
                height: 150.0,
              ),
              Expanded(
                flex: 3,
                child:
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child:
                      Text(
                        '$temp°',
                        style:kConditionTextStyle
                      ),
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
             ),
              ),
                ),
              SizedBox(
                height: 50.0,
              ),
              Expanded(
                flex: 1,
                child:
              Card(
               elevation: 30.0,
               color: Colors.transparent,
                shape: new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.white, width: 5.0),
                    borderRadius: BorderRadius.circular(4.0)),
               child:
                   ListTile(
                      leading: Text('Humidity:$humidity1',style: TextStyle(fontSize: 35.0,),),

              ),
              ),
              ),
              Expanded(
                flex: 1,
                child:
                Card(
                elevation: 30.0,
                color: Colors.transparent,
                shape: new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.white, width: 4.0),
                    borderRadius: BorderRadius.circular(4.0)),
                child:
                ListTile(
                  leading: Text('Min Temp:$tempmin',style: TextStyle(fontSize: 35.0,),),

                ),
              ),
              ),
              Expanded(
                flex: 1,
                child:
                Card(

                elevation: 30.0,
                color: Colors.transparent,
                shape: new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.white, width: 4.0),
                    borderRadius: BorderRadius.circular(4.0)),
                child:
                ListTile(
                  leading: Text('Max Temp:$tempmax',style: TextStyle(fontSize: 35.0,),),

                ),
              ),
              ),
              Expanded(
                flex: 1,
                child:
                Card(
                elevation: 30.0,
                color: Colors.transparent,
                shape: new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.white, width: 4.0),
                    borderRadius: BorderRadius.circular(4.0)),
                child:
                ListTile(
                  leading: Text('Pressure:$sunrise'+' Pa',style: TextStyle(fontSize: 35.0,),),

                ),
              ),
              ),
              Expanded(
                flex: 1,
                child:
              Card(
                elevation: 30.0,
                color: Colors.transparent,
                shape: new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.white, width: 4.0),
                    borderRadius: BorderRadius.circular(4.0)),
                child:
                ListTile(
                  leading: Text('Description:$description1',style: TextStyle(fontSize: 35.0,),),

                ),
              ),
              ),
                  ],
                ),
              ),

          ),
        );

  }

}
//var country=weatherData['sys']['country'];
//var  temp=weatherData['main']['temp'];
//var description=weatherData['weather'][0]['description'];
