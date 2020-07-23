import 'package:flt_telephony_info/flt_telephony_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'android_wifi_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  static const String routeName = "/HomePage";

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TelephonyInfo _info;
  String networkInfo;

  @override
  void initState() {
    super.initState();
    getTelephonyInfo();
  }

  Future<void> getTelephonyInfo() async {
    TelephonyInfo info;
    try {
      info = await FltTelephonyInfo.info;
    } on PlatformException {}

    if (!mounted) return;

    setState(() {
      _info = info;

      networkInfo = 'callState: ${_info.callState}'+'\n';
      networkInfo += 'dataNetworkType: ${_info.dataNetworkType}'+'\n';
      networkInfo += 'deviceSoftwareVersion: ${_info.deviceSoftwareVersion}'+'\n';
      networkInfo += 'imei: ${_info.imei}'+'\n';
      networkInfo += 'isDataEnabled: ${_info.isDataEnabled}'+'\n';
      networkInfo += 'isNetworkRoaming: ${_info.isNetworkRoaming}'+'\n';
      networkInfo += 'isSmsCapable: ${_info.isSmsCapable}'+'\n';
      networkInfo += 'isVoiceCapable: ${_info.isVoiceCapable}'+'\n';
      networkInfo += 'line1Number: ${_info.line1Number}'+'\n';
      networkInfo += 'meid: ${_info.meid}'+'\n';
      networkInfo += 'nai: ${_info.nai}'+'\n';
      networkInfo += 'networkCountryIso: ${_info.networkCountryIso}'+'\n';
      networkInfo += 'networkOperator: ${_info.networkOperator}'+'\n';
      networkInfo += 'networkSpecifier: ${_info.networkSpecifier}'+'\n';
      networkInfo += 'networkType: ${_info.networkType}'+'\n';
      networkInfo += 'networkOperatorName: ${_info.networkOperatorName}'+'\n';
      networkInfo += 'phoneCount: ${_info.phoneCount}'+'\n';
      networkInfo += 'phoneType: ${_info.phoneType}'+'\n';
      networkInfo += 'serviceState: ${_info.serviceState}'+'\n';
      networkInfo += 'simCarrierId: ${_info.simCarrierId}'+'\n';
      networkInfo += 'simCarrierIdName: ${_info.simCarrierIdName}'+'\n';
      networkInfo += 'simCountryIso: ${_info.simCountryIso}'+'\n';
      networkInfo += 'simOperator: ${_info.simOperator}'+'\n';
      networkInfo += 'simOperatorName: ${_info.simOperatorName}'+'\n';
      networkInfo += 'simSerialNumber: ${_info.simSerialNumber}'+'\n';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Telephony Manager'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Text(networkInfo),
              ButtonTheme(
                height: 50,
                buttonColor: Colors.blue,
                child: RaisedButton(
                  child: Text(
                    'Flutter Android',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyAndroidWifiInfo(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}

//import 'dart:async';
//
//import 'package:android_wifi_info/android_wifi_info.dart';
//import 'package:flutter/material.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  // Public methods
//  Future<String> bssid;
//  // TODO: detailedStateOf
//  Future<int> frequency;
//  Future<bool> ssidHidden;
//  Future<int> ipAddress;
//  Future<int> linkSpeed;
//  Future<String> macAddress;
//  Future<int> networkId;
//  Future<int> rssi;
//  Future<int> rxLinkSpeedMbps;
//  Future<String> ssid;
//  // TODO: supplicantState
//  // Future<SupplicantState> supplicantState;
//  Future<int> txLinkSpeedMbps;
//  // Constants
//  Future<String> frequencyUnits;
//  Future<String> linkSpeedUnits;
//
//  @override
//  void initState() {
//    fireAllFutures();
//    super.initState();
//  }
//
//  fireAllFutures() {
//    setState(() {
//      // Public methods
//      bssid = AndroidWifiInfo.bssid;
//      frequency = AndroidWifiInfo.frequency;
//      ssidHidden = AndroidWifiInfo.ssidHidden;
//      ipAddress = AndroidWifiInfo.ipAddress;
//      linkSpeed = AndroidWifiInfo.linkSpeed;
//      macAddress = AndroidWifiInfo.macAddress;
//      networkId = AndroidWifiInfo.networkId;
//      rssi = AndroidWifiInfo.rssi;
//      rxLinkSpeedMbps = AndroidWifiInfo.rxLinkSpeedMbps;
//      ssid = AndroidWifiInfo.ssid;
//      txLinkSpeedMbps = AndroidWifiInfo.txLinkSpeedMbps;
//      // Constants
//      frequencyUnits = AndroidWifiInfo.frequencyUnits;
//      linkSpeedUnits = AndroidWifiInfo.linkSpeedUnits;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//          appBar: AppBar(
//            actions: <Widget>[
//              IconButton(
//                icon: Icon(Icons.refresh),
//                onPressed: fireAllFutures,
//              )
//            ],
//            title: Text(
//              'android_wifi_info',
//              style: TextStyle(
//                fontFamily: 'monospace',
//                fontWeight: FontWeight.w600,
//              ),
//            ),
//            backgroundColor: Colors.lightGreen,
//          ),
//          body: ListView(
//            children: <Widget>[
//              // PUBLIC METHODS
//              buildFutureListTile(
//                future: bssid,
//                name: 'bssid',
//                description: Column(
//                  children: <Widget>[
//                    TText(
//                        'Basic service set identifier (BSSID) of the current access point.'),
//                    TText(
//                        'Returns BSSID, in the form of a six-byte MAC address: XX:XX:XX:XX:XX:XX'),
//                    TText(
//                        'The BSSID may be null if there is no network currently connected.')
//                  ],
//                ),
//                type: 'String',
//              ),
//              // TODO: detailedStateOf
//              buildFutureListTile(
//                  future: frequency,
//                  name: 'frequency',
//                  description: Column(
//                    children: <Widget>[TText('Current WiFi frequency in MHz')],
//                  ),
//                  type: 'int'),
//              buildFutureListTile(
//                future: ssidHidden,
//                name: 'ssidHidden',
//                description: Column(
//                  children: <Widget>[
//                    TText('Shows whether the current network is hidden.'),
//                    TText(
//                        'true if this network does not broadcast its SSID, so an SSID-specific probe request must be used for scans.')
//                  ],
//                ),
//                type: 'bool',
//              ),
//              buildFutureListTile(
//                future: ipAddress,
//                name: 'ipAddress',
//                description: Column(
//                  children: <Widget>[
//                    TText('IP Address.'),
//                  ],
//                ),
//                type: 'int',
//              ),
//              buildFutureListTile(
//                future: linkSpeed,
//                name: 'linkSpeed',
//                description: Column(
//                  children: <Widget>[
//                    TText('Current link speed in Mbps.'),
//                  ],
//                ),
//                type: 'int',
//              ),
//              buildFutureListTile(
//                future: macAddress,
//                name: 'macAddress',
//                description: Column(
//                  children: <Widget>[
//                    TText('MAC Address'),
//                    TText(
//                        'Using these device identifiers is not recommended other than for high value fraud prevention and advanced telephony use-cases. For advertising use-cases, use AdvertisingIdClient\$Info#getId and for analytics, use InstanceId#getId.'),
//                    // TODO: links
//                  ],
//                ),
//                type: 'String',
//              ),
//              buildFutureListTile(
//                future: networkId,
//                name: 'networkId',
//                description: Column(
//                  children: [
//                    TText('Network ID.'),
//                    TText(
//                        'Each configured network has a unique small integer ID, used to identify the network when performing operations on the supplicant. This method returns the ID for the currently connected network.')
//                  ],
//                ),
//                type: 'int',
//              ),
//              buildFutureListTile(
//                future: rssi,
//                name: 'rssi',
//                description: Column(
//                  children: [
//                    TText('Received Signal Strength Indicator.'),
//                    TText(
//                        'Returns the received signal strength indicator of the current 802.11 network, in dBm.')
//                  ],
//                ),
//                type: 'int',
//              ),
//              /*
//              buildFutureListTile(
//                future: rxLinkSpeedMbps,
//                name: 'rxLinkSpeedMbps',
//                description: Column(
//                  children: [Text('Current receive link speed in Mbps.')],
//                ),
//                type: 'int',
//              ), */
//              buildFutureListTile(
//                future: ssid,
//                name: 'ssid',
//                description: Column(
//                  children: <Widget>[
//                    TText(
//                        'Service set identifier (SSID aka WiFi Name) of the current 802.11 network.'),
//                  ],
//                ),
//                type: 'String',
//              ),
//              // TODO: supplicantState
//              /*
//              buildFutureListTile(
//                future: txLinkSpeedMbps,
//                name: 'txLinkSpeedMbps',
//                description: Column(
//                  children: [
//                    Text(
//                        'Current transmit link speed in [linkSpeedUnits] (Mbps).')
//                  ],
//                ),
//                type: 'int',
//              ),*/
//              // CONSTANTS
//              buildFutureListTile(
//                future: frequencyUnits,
//                name: 'frequencyUnits',
//                description: Column(
//                  children: <Widget>[
//                    TText(
//                        'The unit in which frequency measurements expressed in this API.'),
//                    TText('Constant Value: "MHz".'),
//                    TText(
//                        'As it\'s constant value, it doesn\'t really make much sense to call it all the time, but as the package decided to provide an interface to the WifiInfo class, frequencyUnits is also part of the API.'),
//                  ],
//                ),
//                type: 'String',
//              ),
//              buildFutureListTile(
//                future: linkSpeedUnits,
//                name: 'linkSpeedUnits',
//                description: Column(
//                  children: <Widget>[
//                    TText('The unit in which links speeds are expressed.'),
//                    TText('Constant Value: "Mbps".'),
//                    TText(
//                        'As it\'s constant value, it doesn\'t really make much sense to call it all the time, but as the package decided to provide an interface to the WifiInfo class, linkSpeedUnits is also part of the API.'),
//                  ],
//                ),
//                type: 'linkSpeedUnits',
//              ),
//            ],
//          )),
//    );
//  }
//
//  Widget buildFutureListTile({
//    @required Future future,
//    @required String name,
//    @required Widget description,
//    @required String type,
//  }) {
//    List<Widget> expansionTileChildren = [
//      Padding(
//        padding: EdgeInsets.all(8.0),
//        child: Row(
//          children: [
//            Text('Type: '),
//            Text(type, style: TextStyle(fontFamily: 'monospace')),
//          ],
//        ),
//      ),
//      Padding(padding: EdgeInsets.all(8.0), child: description),
//    ];
//    final nameWidget = Text(
//      '$name ',
//      style: TextStyle(
//        fontWeight: FontWeight.bold,
//        fontFamily: 'monospace',
//      ),
//    );
//
//    return FutureBuilder(
//      future: future,
//      builder: (context, snapshot) {
//        final titleWidget = Row(children: <Widget>[
//          nameWidget,
//          Text(
//            '${snapshot.data}',
//            style: TextStyle(fontFamily: 'monospace'),
//          ),
//        ]);
//        if (snapshot.hasError) {
//          return ExpansionTile(
//            leading: Icon(Icons.error, color: Colors.red),
//            title: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(type, style: TextStyle(fontFamily: 'monospace')),
//                Text(name),
//                Text(snapshot.error)
//              ],
//            ),
//            children: [description, Text(snapshot.error)],
//          );
//        }
//        switch (snapshot.connectionState) {
//          case ConnectionState.active:
//            return Text('active');
//          case ConnectionState.done:
//            return ExpansionTile(
//              leading: snapshot.hasData
//                  ? Icon(Icons.check_circle, color: Colors.green)
//                  : Icon(Icons.error_outline, color: Colors.orange),
//              title: titleWidget,
//              children: expansionTileChildren,
//            );
//          case ConnectionState.none:
//            return ExpansionTile(
//              leading: Icon(Icons.help_outline, color: Colors.red),
//              title: titleWidget,
//              children: expansionTileChildren,
//            );
//          case ConnectionState.waiting:
//            return ExpansionTile(
//              leading: Icon(Icons.hourglass_empty, color: Colors.grey[400]),
//              title: titleWidget,
//              children: expansionTileChildren,
//            );
//        }
//      },
//    );
//  }
//}
//
//class TText extends StatelessWidget {
//  final text;
//
//  TText(this.text, {Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) => SizedBox(
//    width: double.infinity,
//    child: Container(child: Text(text, textAlign: TextAlign.left)),
//  );
//}
