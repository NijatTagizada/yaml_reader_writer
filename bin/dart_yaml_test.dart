import 'dart:io';

import 'package:yaml/yaml.dart';

import 'yaml_writer.dart';

void main(List<String> arguments) async {
  var yamlFile = File('pubspec.yaml');
  String yamlStr = await yamlFile.readAsString();
  YamlMap yamlMap = loadYaml(yamlStr);
  Map map = yamlMap.toMap();

  Map dependenciesMap = map['dependencies'];
  dependenciesMap['dio'] = '^4.0.1';
  dependenciesMap['http'] = '^0.13.4';

  final writer = YamlWriter();
  String writeString = writer.write(map);
  yamlFile.writeAsStringSync(writeString, mode: FileMode.write);
}
