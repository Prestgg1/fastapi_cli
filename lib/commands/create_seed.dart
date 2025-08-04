import 'dart:io';
import 'package:ansicolor/ansicolor.dart';

void createSeed(String modelName) {
  final green = AnsiPen()..green(bold: true);
  final red = AnsiPen()..red(bold: true);
  final yellow = AnsiPen()..yellow(bold: true);

  final seedsDir = Directory('seeds');
  if (!seedsDir.existsSync()) {
    seedsDir.createSync(recursive: true);
    print(green('✅ "seeds/" qovluğu yaradıldı.'));
  }

  final className = modelName[0].toUpperCase() + modelName.substring(1);
  final fileName = modelName.toLowerCase();
  final seedFile = File('seeds/${fileName}_seed.py');

  if (seedFile.existsSync()) {
    print(red('⚠️ Seed faylı artıq mövcuddur: seeds/${fileName}_seed.py'));
    return;
  }

  final content = '''
from models.$fileName import $className

def seed_${fileName}():
    data = [
        $className(id=1, name="Nümunə 1", created_at="2025-01-01", updated_at="2025-01-01"),
        $className(id=2, name="Nümunə 2", created_at="2025-01-01", updated_at="2025-01-01"),
    ]
    return data
''';

  seedFile.writeAsStringSync(content);
  print(green('✅ Seed faylı yaradıldı: seeds/${fileName}_seed.py'));
}
