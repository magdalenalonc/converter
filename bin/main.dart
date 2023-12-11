import 'dart:io';

import 'package:prompter_ml_2137/prompter_ml_2137.dart';
import 'package:converter/src/converter.dart';

void main() {
  final prompter = Prompter();

  final choice = prompter.askBinary('Are you here to convert an image?');
  if (!choice) {
    exit(0);
  }

  List<Option> buildFormatOptions() {
    return [
      Option('Convert to jpeg', 'jpeg'),
      Option('Convert to png', 'png'),
    ];
  }

  List<Option> buildFileOptions() {
    return Directory.current.listSync().where((entity) {
      return FileSystemEntity.isFileSync(entity.path) &&
          entity.path.contains(RegExp(r'\.(png|jpg|jpeg)'));
    }).map((entity) {
      final filename = entity.path.split(Platform.pathSeparator).last;
      return Option(filename, entity);
    }).toList();
  }

  final format = prompter.askMultiple('Select format:', buildFormatOptions());
  final selectedFile =
      prompter.askMultiple('Select an image to convert', buildFileOptions());

  final newPath = convertImage(selectedFile, format);
}
