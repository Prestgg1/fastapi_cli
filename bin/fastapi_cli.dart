import 'package:ansicolor/ansicolor.dart';
import 'package:fastapi_cli/commands/create_model.dart';
import "package:fastapi_cli/commands/create_router.dart";
import "package:fastapi_cli/commands/create_seed.dart";
import "package:fastapi_cli/commands/run_seed.dart";
import "package:fastapi_cli/commands/create_schema.dart";

void main(List<String> args) {
  var greenPen = AnsiPen()..green(bold: true);
  var redPen = AnsiPen()..red(bold: true);
  var yellowPen = AnsiPen()..yellow(bold: true);
  var cyanPen = AnsiPen()..cyan();

  if (args.isEmpty) {
    print(yellowPen('📘 İstifadə qaydası:'));
    print(cyanPen('  fastapi_cli <əmr> [parametrlər]\n'));
    print(yellowPen('✨ Nümunələr:'));
    print(cyanPen('  fastapi_cli create:model User\n'));
    print(cyanPen('  fastapi_cli create:router User\n'));
    print(cyanPen('  fastapi_cli create:seed User\n'));
    print(cyanPen('  fastapi_cli run:seed User\n'));
    print(cyanPen('  fastapi_cli create:schema User\n'));
    print(yellowPen('ℹ️ Mövcud əmrləri görmək üçün sənədlərə baxın.'));
  } else {
    String command = args[0];
    String? parameter = args.length > 1 ? args[1] : null;

    switch (command) {
      case 'create:model':
        if (parameter == null) {
          print(redPen('❌ Model adı daxil edilməyib.'));
        } else {
          createModel(parameter);
        }
        break;

      case 'create:router':
        if (parameter == null) {
          print(redPen('❌ Router adı daxil edilməyib.'));
        } else {
          createRouter(parameter);
        }
        break;

      case 'create:seed':
        if (parameter == null) {
          print(redPen('❌ Seed adı daxil edilməyib.'));
        } else {
          createSeed(parameter);
        }
        break;

      case 'run:seed':
        if (parameter == null) {
          print(redPen('❌ Seed adı daxil edilməyib.'));
        } else {
          runSeed(parameter);
        }
        break;

      case 'create:schema':
        if (parameter == null) {
          print(redPen('❌ Schema adı daxil edilməyib.'));
        } else {
          createSchema(parameter);
        }
        break;

      default:
        print(redPen('❌ Tanınmayan əmr: "$command"'));
        print(yellowPen('\nℹ️ Əmrlərin siyahısını görmək üçün heç bir arqument olmadan çalışdır:'));
        print(cyanPen('  fastapi_cli'));
    }
  }
}
