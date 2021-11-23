import 'package:cloud_firestore/cloud_firestore.dart';
// import 'model_class.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'model_class.dart';

// class {

// Future<List<ModelClassWallpaper>> getWallpaper()async{
//   return FirebaseFirestore.instance
//       .collection('sds').get()
//       .then((querySnapshot){
//     List<ModelClassWallpaper> images= [];
//     for(var docsnapshot in  querySnapshot.docs){
//       var image = ModelClassWallpaper(wallpaper:docsnapshot.toString());
//      images.add(image);
//     }
//   });
// }

// }

class Firebase {
  Future<List<ModelClassShari>> longShari() async {
    return FirebaseFirestore.instance
        .collection('shari')
        .get()
        .then((querySnapshot) {
      List<ModelClassShari> images = [];
      for (var docSnapshot in querySnapshot.docs) {
        var post = ModelClassShari(shortShari: docSnapshot.data().toString());
        images.add(post);
      }
      return images;
    });
  }

  Future<List<ModelClassShari>> ShortShari() async {
    return FirebaseFirestore.instance
        .collection('ShortShari')
        .get()
        .then((querySnapshot) {
      List<ModelClassShari> images = [];
      for (var docSnapshot in querySnapshot.docs) {
        var post = ModelClassShari(shortShari: docSnapshot.data().toString());
        images.add(post);
      }
      return images;
    });
  }
}
