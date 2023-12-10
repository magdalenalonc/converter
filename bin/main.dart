import 'dart:io';

import 'package:prompter_ml_2137/prompter_ml_2137.dart';

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

  prompter.askMultiple('Select format:', buildFormatOptions());
}
