import 'package:finalproject/chat.dart';
import 'package:flutter/material.dart';

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://hips.hearstapps.com/vidthumb/images/benedict-cumberbatch-doctor-strange-in-the-multiverse-of-madness-1640189540.jpg?crop=0.405xw:1.00xh;0.263xw,0&resize=1200:*"),
            ),
            title: Text(
              " Dr. Kapil Narwani",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text("graduate degree in botany",
                style: TextStyle(color: Colors.white)),
            trailing: Icon(Icons.star_border_purple500_sharp),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Chat()));
            },
            // onTap: () {
            //   Navigator.push(
            //       context, MaterialPageRoute(builder: (context) => Chat()));
            // },
          );
        },
      ),
    );
  }
}
