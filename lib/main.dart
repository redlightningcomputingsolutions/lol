import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        body: PhoneDependentContainer(
          builder: (context, model, deviceInfo) => InkWell(
            onTap: () => print('All Info: $deviceInfo, '),
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
                          model,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorForModel(
                          model,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorForModel(
                          model,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorForModel(
                          model,
                        ),
                      ),
                    ),
                    Container(
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: colorForModel(
                          model,
                        ),
                      ),
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.grey,
                      child: Center(
                        child: Text('model: ${model}, '),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class PhoneDependentContainer extends StatelessWidget {
  final Widget Function(BuildContext, String, dynamic) builder;
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  PhoneDependentContainer({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
        return Center(
          child: FutureBuilder<AndroidDeviceInfo>(
            future: deviceInfo.androidInfo,
            builder: (context, snapshot) => Visibility(
              visible: snapshot.hasData,
              child: builder(
                context,
                snapshot.data.model,
                snapshot.data,
              ),
            ),
          ),
        );
      case TargetPlatform.iOS:
        return Center(
          child: FutureBuilder<IosDeviceInfo>(
            future: deviceInfo.iosInfo,
            builder: (context, snapshot) => Visibility(
              visible: snapshot.hasData,
              child: builder(
                context,
                snapshot.data.model,
                snapshot.data,
              ),
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
