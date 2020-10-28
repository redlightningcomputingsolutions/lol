import 'package:babyshaarkapp/Container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_banner/notification_alert.dart';
import 'notification_banner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:device_info/device_info.dart';
import 'package:async/async.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo;

  Color colorForModel(String model) {
    if (model == "sdk_gphone_x86") {
      return Colors.amber;
    }
    if (model == "SM-N976U") {
      return Colors.black;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey,
    body: Center(
      child: FutureBuilder<AndroidDeviceInfo>(
        future: deviceInfo.androidInfo,
        builder: (context, snapshot) => Visibility(
          visible: snapshot.hasData,
          child: InkWell(
            onTap: () => print('Manufacturer: ${snapshot.data.device}, '),
            child: Container(
              child: SizedBox(
                height: 160.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorForModel(
                          snapshot.data.model,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorForModel(
                          snapshot.data.model,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorForModel(
                          snapshot.data.model,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorForModel(
                          snapshot.data.model,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorForModel(
                          snapshot.data.model,
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.grey,
                      child: Center(
                        child: Text('model: ${snapshot.data.model}, '),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
