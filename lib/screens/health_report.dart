import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:foodepie/components/rounded_button.dart';

class HealthReport extends StatefulWidget {
  @override
  _HealthReportState createState() => _HealthReportState();
}

class _HealthReportState extends State<HealthReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Health Report',
                  style: TextStyle(fontSize: 27,
                    color: Color(0xff080040),),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Every human being is the author of his own health or disease.',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RoundedButton(
                  title: "Open Date picker",
                  colour: Color(0xffFBAF02),
                  onPressed: () async {
                    var datePicked = await DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: DateTime(1994),
                      firstDate: DateTime(1960),
                      lastDate: DateTime(2012),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      //looping: true,
                    );

                    final snackBar =
                        SnackBar(content: Text("Date Picked $datePicked"));
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircularPercentIndicator(
                        radius: 100.0,
                        animation: true,
                        lineWidth: 10.0,
                        percent: 0.5,
                        header: new Text(
                          "Proteins",
                          style:
                              TextStyle(color: Color(0xff080040), fontSize: 27),
                        ),
                        center: Text(
                          '50%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 27),
                        ),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.blue,
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      new CircularPercentIndicator(
                        radius: 100.0,
                        animation: true,
                        lineWidth: 10.0,
                        percent: 0.7,
                        header: new Text(
                          "Fats",
                          style:
                              TextStyle(color: Color(0xff080040), fontSize: 27),
                        ),
                        center: new Text(
                          '70%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 27),
                        ),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.lightGreen,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                new CircularPercentIndicator(
                  radius: 100.0,
                  animation: true,
                  lineWidth: 10.0,
                  percent: 0.3,
                  header: new Text(
                    "Calories",
                    style: TextStyle(color: Color(0xff080040), fontSize: 27),
                  ),
                  center: Text(
                    '30%',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                  ),
                  backgroundColor: Colors.grey,
                  progressColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
