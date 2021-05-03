import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:random_kitties/model/helper/CatPhotoHelper.dart';
import 'package:random_kitties/model/glitch/glitch.dart';
import 'package:random_kitties/model/core/CatPhoto.dart';
import 'dart:async';

class CatProvider extends ChangeNotifier {
  final _helper = CatPhotoHelper();
  final _streamController = StreamController<Either<Glitch, CatPhoto>>();
  Stream<Either<Glitch, CatPhoto>> get catPhotoStream {
    return _streamController.stream;
  }

  Future<void> getTwentyRandomPhoto() async {
    for (int i = 0; i < 20; i++) {
      final catHelperResult = await _helper.getRandomCatPhoto();
      _streamController.add(catHelperResult);
    }
  }
}
