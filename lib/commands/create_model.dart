import 'dart:io';
import 'package:ansicolor/ansicolor.dart';

void createModel(String name) async {
  var green = AnsiPen()..green(bold: true);
  var red = AnsiPen()..red(bold: true);
  var yellow = AnsiPen()..yellow(bold: true);
  var cyan = AnsiPen()..cyan();

  final modelsDir = Directory('models');

  if (!modelsDir.existsSync()) {
    print(red('📁 "models/" qovluğu tapılmadı.'));
    stdout.write(yellow('➕ Yaratmaq istəyirsiniz? (bəli/xeyr): '));
    final response = stdin.readLineSync();

    if (response?.toLowerCase() != 'bəli') {
      print(red('❌ Əməliyyat ləğv edildi.'));
      return;
    }

    modelsDir.createSync(recursive: true);
    print(green('✅ "models/" qovluğu yaradıldı.'));
  }

  final className = name[0].toUpperCase() + name.substring(1);
  final fileName = name.toLowerCase();
  final file = File('models/$fileName.py');

  if (file.existsSync()) {
    print(red('⚠️  Model artıq mövcuddur: models/$fileName.py'));
    return;
  }

  final content = '''
from pydantic import BaseModel
from datetime import datetime

class $className(BaseModel):
    id: int
    name: str
    created_at: datetime
    updated_at: datetime
''';
  file.writeAsStringSync(content);
  print(green('✅ Model yaradıldı: models/$fileName.py'));
}
