import 'package:app_vote/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'models/candidate.dart';

class FaceError extends StatefulWidget {
  final Candidate candidate;
  const FaceError({ required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CameraPage(candidate:candidate)),
            );
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}