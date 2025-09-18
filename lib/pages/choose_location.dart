import 'package:flutter/material.dart';
import 'package:world_time/services/world_clock.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldClock> locations = [
    WorldClock(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldClock(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldClock(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldClock(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldClock(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldClock(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldClock(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldClock(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldClock(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldClock instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location!),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
