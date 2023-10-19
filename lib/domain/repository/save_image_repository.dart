import 'dart:io';
import 'package:find_work/data/local_data_source.dart';

abstract class ImageRepository {
  Future<void> saveImage(File? image);
  String? readImage(String? image);
  Future<bool> removeImage();
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

  @override
  Future<bool> removeImage() {
    return dataSource.remove(StorageKey.image);
  }

}