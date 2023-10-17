import 'dart:io';

import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  File? _imagenTemporal;

  String _opcion = "";

  var imagen;

  Future getImagen(String opcion) async {

    if (opcion == "camera") {

      imagen = ImageSource.camera;

    } else if (opcion == "gallery") {

      imagen = ImageSource.gallery;
    }
    _imagenTemporal = imagen;
    GallerySaver.saveImage(_imagenTemporal!.path);
    File savedImage = await imagen.copy(_imagenTemporal!.path);
  }


}