import 'dart:typed_data';
// import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shariconsole/repositery.dart';
import 'model_class.dart';

class FullPageShort extends StatefulWidget {
  const FullPageShort({Key? key}) : super(key: key);

  @override
  _FullPageShortState createState() => _FullPageShortState();
}

class _FullPageShortState extends State<FullPageShort> {
  @override
  late List<ModelClassShari> modelClassShari;
  ScreenshotController screenshotController = ScreenshotController();
  var repositery = ShariRepositery();
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    var list = await repositery.getShortShari();
    setState(() {
      modelClassShari = list;
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () async {
            screenshotController
                .capture(delay: Duration(milliseconds: 10))
                .then((capturedImage) async {
              ShowCapturedWidget(context, capturedImage!);
            }).catchError((onError) {
              print(onError);
            });
            final image = await screenshotController.capture();
            if (image == null) return;
            // await saveImage(image);
          },
          child: Icon(Icons.screenshot),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        body: Screenshot(
          controller: screenshotController,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('image/11.jpg'), fit: BoxFit.fill)),
            child: PageView.builder(
              itemCount: null == modelClassShari ? 0 : modelClassShari.length,
              itemBuilder: (BuildContext context, int index) {
                ModelClassShari modelclass = modelClassShari[index];
                return PageView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          // (image:AssetImage('image/18.jpg'),fit: BoxFit.fill)
                          modelclass.shortShari,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                          // maxLines: 6,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured  screenshot"),
        ),
        body: Center(
          child:
              capturedImage != null ? Image.memory(capturedImage) : Container(),
        ),
      ),
    );
  }

  // Future<String> saveImage(Uint8List bytes) async {
  //   await [Permission.storage].request();
  //   final time = DateTime.now()
  //       .toIso8601String()
  //       .replaceAll('.', '-')
  //       .replaceAll('.', '-');
  //   final name = "screenshot_$time";
  //   final result = await ImageGallerySaver.saveImage(bytes, name: name);
  //   return result['filePath'];
  // }
//
}
