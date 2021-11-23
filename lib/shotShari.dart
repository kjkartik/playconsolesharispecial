import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shariconsole/repositery.dart';
import 'model_class.dart';
import 'package:flutter/material.dart';

class ShortShari extends StatefulWidget {
  const ShortShari({Key? key}) : super(key: key);

  @override
  _ShortShariState createState() => _ShortShariState();
}

class _ShortShariState extends State<ShortShari> {
  @override
  late List<ModelClassShari> _modelClassShari;
  var repositery = ShariRepositery();

  void initState() {
    super.initState();
    _shortShari();
  }

  _shortShari() async {
    var shari = await repositery.getShortShari();
    setState(() {
      _modelClassShari = shari;
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
                ' SHORT SHARI',
              ),
            ),
            flexibleSpace: Image(
              image: AssetImage('image/4.jpg'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('image/10.jpg'), fit: BoxFit.fill)),
          child: ListView.builder(
            itemCount: null == _modelClassShari ? 0 : _modelClassShari.length,
            itemBuilder: (BuildContext context, int index) {
              ModelClassShari shari = _modelClassShari[index];
              return Card(
                color: Colors.transparent,
                elevation: 25.0,
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(shari.shortShari,
                                textStyle: TextStyle(color: Colors.white)),
                          ],
                          totalRepeatCount: 1,
                          isRepeatingAnimation: true,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          new ClipboardData(
                            text: shari.shortShari,
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
                          Icon(Icons.copy),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
