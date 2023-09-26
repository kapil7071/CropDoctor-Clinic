import 'dart:io';

import 'package:finalproject/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'Button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  File? _image;
  List? _output;

  // String nam = "${_output![0]['label']}";
  final picker = ImagePicker();
  //final Uri uri = Uri.parse('https://www.google.com/search? Text ${_output![0]['label']} ');

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  classfiyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
      asynch: true,
    );
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
  }

  closeModel() async {
    await Tflite.close();
  }

  @override
  void dispose() {
    super.dispose();
    closeModel();
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }
    setState(() {
      _image = File(image.path);
    });

    classfiyImage(_image!);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    setState(() {
      _image = File(image.path);
    });

    classfiyImage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 160, 105, 255),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'CropDoctor Clinic',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Your crops best friend in Ever Season ',
                  style: TextStyle(color: Colors.black, fontSize: 23),
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Align(
                alignment: Alignment.topCenter,
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                child: _loading
                    ? Container(
                        width: 350,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      )
                    : Container(
                        child: Column(
                          children: [
                            Container(
                              height: 250,
                              child: Image.file(_image! as File),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            _output != null
                                ? Text(
                                    "${_output![0]['label']}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Button(
                      onTap: () {
                        if (_loading == false) {
                          setState(() {
                            _loading = true;
                          });
                        }
                        pickImage();
                      },
                      text: 'Take a photo',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Button(
                        onTap: () {
                          if (_loading == false) {
                            setState(() {
                              _loading = true;
                            });
                          }
                          pickGalleryImage();
                        },
                        text: 'Gallery'),
                    SizedBox(
                      height: 30,
                    ),
                    // Button(
                    //     onTap: () {
                    //       launchUrl(uri);
                    //     },
                    //     text: "hello"),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    Button(
                        onTap: () {
                          setState(() {
                            _loading = true;
                          });
                        },
                        text: 'Reset'),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Doctor()));
                    },
                    child: Text("View Doctor")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
