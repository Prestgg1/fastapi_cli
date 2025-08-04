import 'dart:io';
import 'package:ansicolor/ansicolor.dart';

void createSchema(String name) async {
  final green = AnsiPen()..green(bold: true);
  final red = AnsiPen()..red(bold: true);
  final yellow = AnsiPen()..yellow(bold: true);

  final modelsDir = Directory('models');
  final schemasDir = Directory('schemas');

  final modelFile = File('models/${name.toLowerCase()}.py');

  if (!modelFile.existsSync()) {
    print(red('❌ Model tapılmadı: models/${name.toLowerCase()}.py'));
    return;
  }

  if (!schemasDir.existsSync()) {
    print(yellow('📁 "schemas/" qovluğu tapılmadı. Yaradılır...'));
    schemasDir.createSync(recursive: true);
    print(green('✅ "schemas/" qovluğu yaradıldı.'));
  }

  final className = name[0].toUpperCase() + name.substring(1);
  final schemaFile = File('schemas/${name.toLowerCase()}_schema.py');

  if (schemaFile.existsSync()) {
    print(red('⚠️ Schema artıq mövcuddur: schemas/${name.toLowerCase()}_schema.py'));
    return;
  }

  final content = '''
from pydantic import BaseModel
from datetime import datetime

class ${className}Base(BaseModel):
    name: str

class ${className}Create(${className}Base):
    pass

class ${className}Update(${className}Base):
    pass

class ${className}InDB(${className}Base):
    id: int
    created_at: datetime
    updated_at: datetime
''';

  schemaFile.writeAsStringSync(content);
  print(green('✅ Schema yaradıldı: schemas/${name.toLowerCase()}_schema.py'));
}
