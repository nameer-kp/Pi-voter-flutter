import 'package:flutter/material.dart';

class FaceId extends StatefulWidget {
  FaceId({Key? key}) : super(key: key);

  @override
  State<FaceId> createState() => _FaceIdState();
}

class _FaceIdState extends State<FaceId> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.how_to_vote_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
            label: Text(
              "Panchayath Election",
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 30, 133, 194),
              fixedSize: const Size(208, 43),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.how_to_vote_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
            label: Text(
              "LokaSaba Election",
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 3, 133, 194),
              fixedSize: const Size(208, 43),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.how_to_vote_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
            label: Text(
              "RajaSaba Election",
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 3, 133, 194),
              fixedSize: const Size(208, 43),
            ),
          )
        ],
      ),
    );
  }
}
