import 'dart:io';

import 'package:yaml/yaml.dart';

import 'yaml_writer.dart';

void main(List<String> arguments) async {
  // Get File
  var yamlFile = File('pubspec.yaml');

  // Convert to YamlMap
  String yamlStr = await yamlFile.readAsString();
  YamlMap yamlMap = loadYaml(yamlStr);

  // Convert to Map
  Map map = yamlMap.toMap();

  // Dependencies section
  Map dependenciesMap = map['dependencies'];
  dependenciesMap['dio'] = '^4.0.1';
  dependenciesMap['http'] = '^0.13.4';

  // Write map in yaml
  final writer = YamlWriter();
  String writeString = writer.write(map);
  yamlFile.writeAsStringSync(writeString, mode: FileMode.write);
}
