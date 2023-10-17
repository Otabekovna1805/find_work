import 'dart:io';

import 'package:find_work/domain/repository/save_image_repository.dart';
import 'package:flutter/material.dart';

import '../data/local_data_source.dart';
import '../domain/repository/theme_repository.dart';


late final ThemeRepository themeRepository;
late final ImageRepository imageRepository;
late final ValueNotifier<ThemeMode> mode;

Future<void> serviceLocator() async {
  /// third party api => storage
  final db = await LocalDataSourceImpl.init;

  /// data
  LocalDataSource dataSource = LocalDataSourceImpl(db: db);

  /// repository
  themeRepository = ThemeRepositoryImpl(dataSource: dataSource);
  imageRepository = ImageRepositoryImpl(dataSource: dataSource);

  /// setting
  mode = ValueNotifier(themeRepository.getMode());
}