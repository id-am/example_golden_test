import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// Archivo de configuración para inicializar los golden tests
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      // Factor de escala para los goldens, útil para diferentes densidades de píxeles
      defaultDevices: [
        Device(name: 'default_phone', size: const Size(400, 800)),
      ],
      // Si estamos en un entorno de CI, puede ser útil cambiar la configuración
      enableRealShadows: true,
    ),
  );
}
