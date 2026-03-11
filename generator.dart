import 'dart:io';

const String globalPath = './lib/global';

List<String> filesCore = [
  "./lib/core/error/error.dart",
  "./lib/core/theme/theme.dart",
  "./lib/core/util/util.dart",
  "./lib/core/widget/widget.dart",
];

List<String> fileBarrels = [
  "./lib/global/screens.dart",
  "./lib/global/widgets.dart",
  "./lib/global/models.dart",
  "./lib/global/services.dart",
  "./lib/global/cubits.dart",
];

void main(List<String> args) async {
  final String value = args[0];

  DefaultDirectoryGenerator.generate();
  FeatureGenerator.generate(value);
}

class DefaultDirectoryGenerator {
  static void generate() {
    List<List<String>> cores = [filesCore, fileBarrels];

    for (final core in cores) {
      for (final c in core) {
        final f = File(c);
        if (!f.existsSync()) {
          f.createSync(recursive: true);
        }
      }
    }
  }
}

class FeatureGenerator {
  static Future<void> generate(String value) async {
    String moduleName = value.split("/")[0];

    final File screenFile =
        File("./lib/$value/screen/${moduleName}_screen.dart");
    final File widgetFile =
        File("./lib/$value/widget/${moduleName}_widget.dart");
    final File modelFile = File("./lib/$value/model/${moduleName}_model.dart");
    final File stateDataFile = File("./lib/$value/model/${moduleName}_state_data_model.dart");
    final File serviceFile =
        File("./lib/$value/service/${moduleName}_service.dart");
    final File cubitFile = File("./lib/$value/cubit/${moduleName}_cubit.dart");
    final File stateFile = File("./lib/$value/cubit/${moduleName}_state.dart");

    if (!screenFile.existsSync()) {
      screenFile.createSync(recursive: true);
      screenFile.writeAsStringSync(await ScreenGenerator.generate(value));
    }

    if (!widgetFile.existsSync()) {
      widgetFile.createSync(recursive: true);
      widgetFile.writeAsStringSync(await WidgetGenerator.generate(value));
    }

    if (!modelFile.existsSync()) {
      modelFile.createSync(recursive: true);
      modelFile.writeAsStringSync(await ModelGenerator.generate(value));
    }

    if (!stateDataFile.existsSync()) {
      stateDataFile.createSync(recursive: true);
      stateDataFile.writeAsStringSync(await StateDataGenerator.generate(value));
    }

    if (!serviceFile.existsSync()) {
      serviceFile.createSync(recursive: true);
      serviceFile.writeAsStringSync(await ServiceGenerator.generate(value));
    }

    if (!cubitFile.existsSync()) {
      cubitFile.createSync(recursive: true);
      cubitFile.writeAsStringSync(await CubitGenerator.generate(value));
    }

    if (!stateFile.existsSync()) {
      stateFile.createSync(recursive: true);
      stateFile.writeAsStringSync(await StateGenerator.generate(value));
    }
  }
}

class ScreenGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    final parentFile = File('$globalPath/screens.dart');
    if (!parentFile
        .readAsStringSync()
        .contains('package:flutter/material.dart')) {
      parentFile.writeAsStringSync("import 'package:flutter/material.dart';\n",
          mode: FileMode.append);
    }
    parentFile.writeAsStringSync(
        'part "../$moduleName/screen/${moduleName}_screen.dart";\n',
        mode: FileMode.append);

    return """
part of "../../global/screens.dart";

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
"""
        .replaceAll("Main", moduleName.toClassName())
        .trim();
  }
}

class WidgetGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    final parentFile = File('$globalPath/widgets.dart');
    if (!parentFile
        .readAsStringSync()
        .contains('package:flutter/material.dart')) {
      parentFile.writeAsStringSync("import 'package:flutter/material.dart';\n",
          mode: FileMode.append);
    }
    parentFile.writeAsStringSync(
        'part "../$moduleName/widget/${moduleName}_widget.dart";\n',
        mode: FileMode.append);

    return """
part of "../../global/widgets.dart";

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
"""
        .replaceAll("Main", moduleName.toClassName())
        .trim();
  }
}

class ModelGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    final parentFile = File('$globalPath/models.dart');
    if (!parentFile
        .readAsStringSync()
        .contains("import 'package:equatable/equatable.dart'")) {
      parentFile.writeAsStringSync(
          "import 'package:equatable/equatable.dart';\n",
          mode: FileMode.append);
    }
    parentFile.writeAsStringSync(
        'part "../$moduleName/model/${moduleName}_model.dart";\n',
        mode: FileMode.append);

    return """
part of "../../global/models.dart";

class MainModel extends Equatable {
  const MainModel();

  @override
  List<Object?> get props => [];

  MainModel copyWith() => const MainModel();

  Map<String, dynamic> toMap() => {};

  factory MainModel.fromMap(Map<String, dynamic> map) =>
      const MainModel();
}
"""
        .replaceAll("Main", moduleName.toClassName())
        .trim();
  }
}

class StateDataGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    final parentFile = File('$globalPath/models.dart');
    if (!parentFile
        .readAsStringSync()
        .contains("import 'package:equatable/equatable.dart'")) {
      parentFile.writeAsStringSync(
          "import 'package:equatable/equatable.dart';\n",
          mode: FileMode.append);
    }
    parentFile.writeAsStringSync(
        'part "../$moduleName/model/${moduleName}_state_data_model.dart";\n',
        mode: FileMode.append);

    return """
part of "../../global/models.dart";

class MainModel extends Equatable {
  const MainModel();

  @override
  List<Object?> get props => [];

  MainModel copyWith() => const MainModel();

  factory MainModel.init()
    => MainModel();
}
"""
        .replaceAll("Main", '${moduleName.toClassName()}StateData')
        .trim();
  }
}

class ServiceGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    final parentFile = File('$globalPath/services.dart');
    parentFile.writeAsStringSync(
        'part "../$moduleName/service/${moduleName}_service.dart";\n',
        mode: FileMode.append);

    return """
part of "../../global/services.dart";

class MainService {
}
"""
        .replaceAll("Main", moduleName.toClassName())
        .trim();
  }
}

class CubitGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    final parentFile = File('$globalPath/cubits.dart');
    parentFile.writeAsStringSync(
        'export "../$moduleName/cubit/${moduleName}_cubit.dart";\n',
        mode: FileMode.append);

    return """
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '${moduleName.toLowerCase()}_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
}

"""
        .replaceAll("Main", moduleName.toClassName())
        .trim();
  }
}

class StateGenerator {
  static Future<String> generate(String value) async {
    String moduleName = value.split("/")[0];
    return """
part of '${moduleName.toLowerCase()}_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}

// class MainLoading extends MainState {}

// class MainSuccess extends MainState {}

// class MainFailed extends MainState {}

"""
        .replaceAll("Main", moduleName.toClassName())
        .trim();
  }
}

extension StringExtension on String {
  String toClassName() {
    return split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join('');
  }

  String toCamelCase() {
    List<String> words = split('_');
    String firstWord = words[0];
    String camelCase = firstWord +
        words
            .sublist(1)
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join('');
    return camelCase;
  }

  String toTitleCase() {
    List<String> words = split('_');
    String titleCase = words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
    return titleCase;
  }
}
