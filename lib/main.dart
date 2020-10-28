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
          androidBuilder: (context, model, deviceInfo, debugableInfo) =>
              InkWell(
            onTap: () => print('All Info: $debugableInfo, '),
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
                        child:
                            Text('manufacturer: ${deviceInfo.manufacturer}, '),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          iOSBuilder: (context, model, deviceInfo, debugableInfo) => InkWell(
            onTap: () => print('All Info: $debugableInfo, '),
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
  final Widget Function(BuildContext, String, AndroidDeviceInfo, Map)
  androidBuilder;
  final Widget Function(BuildContext, String, IosDeviceInfo, Map) iOSBuilder;
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  PhoneDependentContainer({
    Key key,
    @required this.iOSBuilder,
    @required this.androidBuilder,
  }) : super(key: key);

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  @override
  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
        return Center(
          child: FutureBuilder<AndroidDeviceInfo>(
            future: deviceInfo.androidInfo,
            builder: (context, snapshot) => !snapshot.hasData
                ? Container()
                : Visibility(
                    visible: snapshot.hasData,
              child: androidBuilder(
                context,
                snapshot.data.model,
                snapshot.data,
                _readAndroidBuildData(
                  snapshot.data,
                ),
              ),
                  ),
          ),
        );
      case TargetPlatform.iOS:
        return Center(
          child: FutureBuilder<IosDeviceInfo>(
            future: deviceInfo.iosInfo,
            builder: (context, snapshot) => !snapshot.hasData
                ? Container()
                : Visibility(
                    visible: snapshot.hasData,
              child: iOSBuilder(
                context,
                snapshot.data.model,
                snapshot.data,
                _readIosDeviceInfo(
                  snapshot.data,
                ),
              ),
                  ),
          ),
        );
      default:
        return Container();
    }
  }
}
