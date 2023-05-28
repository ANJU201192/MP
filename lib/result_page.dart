// ignore_for_file: no_logic_in_create_state

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'api.dart';

class ResultPage extends StatefulWidget {
  final File image;
  ResultPage({key, required this.image}) : super(key: key) {
    // TODO: implement ResultPage
    throw UnimplementedError();
  }

  @override
  State<StatefulWidget> createState() => ResultPageState(image);
}

class ResultPageState extends State<ResultPage> {
  String captions = "Refresh once !";
  dynamic data;
  File image;
  FlutterTts ftts = FlutterTts();

  ResultPageState(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: const [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.purple!,
            Colors.purpleAccent!,
            Colors.redAccent!,
            Colors.red!,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                //color: Colors.white,
                //margin: EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: const Text(
                  "Captions",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: displayImage(image),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 200,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Text(
                  captions,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  raisedButton(
                    child: const Text(
                      "Refresh",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    elevation: 5.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () => getCaption(),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  raisedButton(
                    child: const Text(
                      "Audio",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    elevation: 5.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () => speakCaption(),
                  ),
                ],
              )
            ],
          ),
        ),
        /*
      floatingActionButton: FloatingActionButton.extended(
                onPressed: () => Navigator.pushNamed(context, "/"),
                icon: Icon(
                Icons.arrow_back,color: Colors.black,size: 30,
                ),
                label: Text("Back",style: TextStyle(color: Colors.black),),
                ),
      */
      ),
    );
  }

  Future getCaption() async {
    data = await getData(uploadUrl);

    setState(() {
      captions = data['captions'];
    });
  }

  speakCaption() async {
    await ftts.setLanguage("en-US");
    await ftts.setPitch(1);
    await ftts.speak(captions);
  }

  Widget displayImage(File file) {
    return SizedBox(
      height: 250.0,
      width: 200.0,
      // ignore: unnecessary_null_comparison
      child: file == null ? Container() : Image.file(file),
    );
  }


  raisedButton({required Text child, required double elevation, required Color color, required RoundedRectangleBorder shape, required Future Function() onPressed}) {}
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<FlutterTts>('ftts', ftts));
  }
}
