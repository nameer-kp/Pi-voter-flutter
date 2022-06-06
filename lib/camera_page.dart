import 'package:app_vote/api/core_api.dart';
import 'package:app_vote/models/candidate.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  final Candidate candidate;
  const CameraPage({this.cameras, Key? key, required this.candidate})
      : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![1],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: 400,
              width: 400,
              child: CameraPreview(controller),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            // onPressed: () async {
            //   pictureFile = await controller.takePicture();
            //   if (pictureFile != null) {
            //     CoreAPI.sendImage(pictureFile!, widget.candidate);
            //   }
            //   setState(() {});
            // },

            onPressed: () async {
              XFile? pickedFile = await ImagePicker().pickImage(
                  source: ImageSource.camera, maxHeight: 1080, maxWidth: 1080);
              if (pickedFile != null) {
                CoreAPI.sendImage(pickedFile!, widget.candidate);
              }
              setState(() {});
            },
            child: const Text('Capture Image'),
          ),
        ),
        // if (pictureFile != null)
        //   Image.network(
        //     pictureFile!.path,
        //     height: 200,
        //   )
        //Android/iOS
        // Image.file(File(pictureFile!.path)))
      ],
    );
  }
}
