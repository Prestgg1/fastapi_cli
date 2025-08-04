import 'dart:io';
import 'package:ansicolor/ansicolor.dart';

void runSeed(String modelName) async {
  final green = AnsiPen()..green(bold: true);
  final red = AnsiPen()..red(bold: true);
  final yellow = AnsiPen()..yellow();

  final fileName = modelName.toLowerCase();
  final seedFile = File('seeds/${fileName}_seed.py');

  if (!seedFile.existsSync()) {
    print(red('❌ seeds/${fileName}_seed.py faylı tapılmadı.'));
    return;
  }

  // Sistemdə python varsa, onu tap
  final pythonCmds = ['python3', 'python'];
  String? python;
  for (final cmd in pythonCmds) {
    final result = await Process.run(cmd, ['--version']);
    if (result.exitCode == 0) {
      python = cmd;
      break;
    }
  }

  if (python == null) {
    print(red('❌ Python sistemdə tapılmadı.'));
    return;
  }

  // Faylı işə sal
  try {
    final result = await Process.run(python, ['seeds/${fileName}_seed.py']);
    print(green('✅ Seed faylı uğurla işə salındı.'));
    if (result.stdout.toString().trim().isNotEmpty) {
      print(yellow(result.stdout));
    }
    if (result.stderr.toString().trim().isNotEmpty) {
      print(red(result.stderr));
    }
  } catch (e) {
    print(red('❌ Seed işlədilərkən xəta baş verdi: $e'));
  }
}
