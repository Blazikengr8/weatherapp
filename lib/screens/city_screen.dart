import 'package:climaapp/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        //constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                   Navigator.pop(context, cityName);

                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.transparent,
                elevation: 15.0,

                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
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