// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library services.grind;

import 'dart:async';
import 'dart:convert' show JSON;
import 'dart:io';

import 'package:grinder/grinder.dart';

Map get _env => Platform.environment;

main(List<String> args) => grind(args);

@Task()
analyze() {
  new PubApp.global('tuneup')..run(['check']);
}

@Task()
test() => Dart.runAsync('test/all.dart');

@DefaultTask()
@Depends(analyze, test)
analyzeTest() => null;

@Task()
coverage() {
  if (!_env.containsKey('REPO_TOKEN')) {
    log("env var 'REPO_TOKEN' not found");
    return;
  }

  PubApp coveralls = new PubApp.global('dart_coveralls');
  coveralls.run([
    'report',
    '--token',
    _env['REPO_TOKEN'],
    '--retry',
    '2',
    '--exclude-test-files',
    'test/all.dart'
  ]);
}

@Task()
@Depends(analyze, test, coverage)
void buildbot() => null;

@Task('Generate the discovery doc and Dart library from the annotated API')
discovery() {
  ProcessResult result =
      Process.runSync('dart', ['bin/services.dart', '--discovery']);

  if (result.exitCode != 0) {
    throw 'Error generating the discovery document\n${result.stderr}';
  }

  File discoveryFile = new File('doc/generated/dartservices.json');
  discoveryFile.parent.createSync();
  log('writing ${discoveryFile.path}');
  discoveryFile.writeAsStringSync(result.stdout.trim() + '\n');

  ProcessResult resultDb =
      Process.runSync('dart', ['bin/services.dart', '--discovery', '--relay']);

  if (result.exitCode != 0) {
    throw 'Error generating the discovery document\n${result.stderr}';
  }

  File discoveryDbFile = new File('doc/generated/_dartpadsupportservices.json');
  discoveryDbFile.parent.createSync();
  log('writing ${discoveryDbFile.path}');
  discoveryDbFile.writeAsStringSync(resultDb.stdout.trim() + '\n');

  // Generate the Dart library from the json discovery file.
  Pub.global.activate('discoveryapis_generator');
  Pub.global.run('discoveryapis_generator:generate', arguments:
      ['files', '--input-dir=doc/generated', '--output-dir=doc/generated']);
}
