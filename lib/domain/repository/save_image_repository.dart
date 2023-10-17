import 'dart:io';

import 'package:find_work/data/local_data_source.dart';
import 'package:flutter/cupertino.dart';

abstract class ImageRepository {
  Future<void> saveImage(File? image);
  String? readImage(String? image);
}

class ImageRepositoryImpl implements ImageRepository {
  final LocalDataSource dataSource;
  const ImageRepositoryImpl({required this.dataSource});

  @override
  Future<void> saveImage(File? image) {
    return dataSource.store(StorageKey.image, image!.path);
  }

  @override
  String? readImage(String? image) {
    return dataSource.read(StorageKey.image);
  }

}