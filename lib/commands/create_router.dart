import 'dart:io';
import 'package:ansicolor/ansicolor.dart';

void createRouter(String name) {
  final green = AnsiPen()..green(bold: true);
  final red = AnsiPen()..red(bold: true);
  final yellow = AnsiPen()..yellow(bold: true);
  final cyan = AnsiPen()..cyan();

  final routersDir = Directory('routers');
  if (!routersDir.existsSync()) {
    routersDir.createSync(recursive: true);
    print(green('✅ "routers/" qovluğu yaradıldı.'));
  }

  final modelName = name[0].toUpperCase() + name.substring(1); // Salam
  final modelFileName = name.toLowerCase(); // salam
  final routerFile = File('routers/${modelFileName}_router.py');

  if (routerFile.existsSync()) {
    print(red('⚠️  Router artıq mövcuddur: routers/${modelFileName}_router.py'));
    return;
  }

  final content = '''
from fastapi import APIRouter
from models.$modelFileName import $modelName

router = APIRouter(prefix="/$modelFileName", tags=["$modelName"])

# Fake DB (temporary)
db = []

@router.get("/")
def list_${modelFileName}s():
    return db

@router.get("/{item_id}")
def show_${modelFileName}(item_id: int):
    for item in db:
        if item["id"] == item_id:
            return item
    return {"error": "$modelName tapılmadı"}

@router.post("/")
def create_${modelFileName}(item: $modelName):
    db.append(item.model_dump())
    return {"message": "$modelName yaradıldı", "data": item}

@router.put("/{item_id}")
def update_${modelFileName}(item_id: int, updated: $modelName):
    for index, item in enumerate(db):
        if item["id"] == item_id:
            db[index] = updated.model_dump()
            return {"message": "$modelName yeniləndi"}
    return {"error": "$modelName tapılmadı"}
''';

  routerFile.writeAsStringSync(content);
  print(green('✅ Router yaradıldı: routers/${modelFileName}_router.py'));
}
