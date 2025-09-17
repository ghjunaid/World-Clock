import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldClock {
  String? location; // location name for the UI
  String? time; // the time in that location
  String? flag; // url to an asset flag icon
  String? url; // location url for api endpoint

  WorldClock({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response = await get(
        Uri.parse("https://timeapi.io/api/time/current/zone?timeZone=$url"),
        headers: {
          "Accept": "application/json",
          "User-Agent": "Mozilla/5.0 (FlutterApp)", // 👈 Trick: looks like a browser
        },
      );
      Map data = jsonDecode(response.body);
      String datetime = data['dateTime'];
      DateTime now = DateTime.parse(datetime);

      // set the time property
      time = DateFormat.jm().format(now);
    }catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

  }
}

