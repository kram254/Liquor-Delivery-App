import 'package:flutter/material.dart';
import 'package:lika/utils/helpers.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double value = 0, min = 0, max = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filter price",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          setHeight(8),
          RangeSlider(
            values: RangeValues(min, max),
            max: 10,
            min: 0,
            onChanged: (v) {
              setState(() {
                min = v.start;
                max = v.end;
              });
            },
          ),
        ],
      ),
    );
  }
}
