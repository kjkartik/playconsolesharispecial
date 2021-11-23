import 'firebase.dart';
import 'model_class.dart';

class ShariRepositery {
  var firebase = Firebase();
  Future<List<ModelClassShari>> getLongShari() async {
    var image = await firebase.longShari();
    return image;
  }

  Future<List<ModelClassShari>> getShortShari() async {
    var image = await firebase.ShortShari();
    return image;
  }
}
