import 'dart:io';

import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<CameraDescription> cameras;
  CameraController _cameraController;
  File _image;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    _cameraController.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    });
  }

  Future getImagesFromGallery() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImagesFromCamera() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        print('Image selected.');
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: CameraPreview(_cameraController),
          ),
          _cameraButtonWidget(),
        ],
      ),
    );
  }

  Widget _cameraButtonWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                getImagesFromGallery();
                setState(() {
                  print("Galeri butonuna tıklandı.");
                });
              },
              child: Icon(
                Icons.image,
                size: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.flash_on,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
