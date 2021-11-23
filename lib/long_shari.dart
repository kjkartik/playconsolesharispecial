import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:shariconsole/repositery.dart';
import 'model_class.dart';

class LongShari extends StatefulWidget {
  const LongShari({Key? key}) : super(key: key);

  @override
  _LongShariState createState() => _LongShariState();
}

class _LongShariState extends State<LongShari> {
  @override
  late List<ModelClassShari> modelClassShari;
  var repositery = ShariRepositery();

  void initState() {
    super.initState();
    _longShari();
  }

  _longShari() async {
    var shari = await repositery.getLongShari();
    setState(() {
      modelClassShari = shari;
    });
  }

  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: AppBar(
          title: Center(
            child: Text(
              'LONG SHARI',
            ),
          ),
          flexibleSpace: Image(
            image: AssetImage('image/1.jpg'),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('image/8.jpg'), fit: BoxFit.fill)),
        child: ListView.builder(
          itemCount: null == modelClassShari ? 0 : modelClassShari.length,
          itemBuilder: (BuildContext context, int index) {
            ModelClassShari modelclass = modelClassShari[index];
            return Card(
              color: Colors.transparent,
              child: Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        // (image:AssetImage('image/18.jpg'),fit: BoxFit.fill)
                        modelclass.shortShari,
                        style: TextStyle(fontSize: 17, color: Colors.white),
                        // maxLines: 6,
//
                      ),
                      // Text
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          new ClipboardData(
                            text: modelclass.shortShari,
                          ),
                        );
                        key.currentState!.showSnackBar(
                          new SnackBar(
                            content: new Text(
                              "copid",
                            ),
                          ),
                        );
                      },
                      icon: Row(
                        children: [
                          Icon(
                            Icons.copy,
                            color: Colors.white,
                          ),
                        ],
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
