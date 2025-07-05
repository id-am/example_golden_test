import 'package:example_golden_test/widgets/custom_card.dart';
import 'package:example_golden_test/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  // Configuración inicial para los golden tests
  setUpAll(() async {
    // Esta línea es importante para inicializar el entorno de golden_toolkit
    await loadAppFonts();
  });

  // Grupo de pruebas para UserAvatar
  group('UserAvatar Golden Tests', () {
    testGoldens('UserAvatar debe verse correctamente', (tester) async {
      // Construimos un widget de prueba con diferentes avatares
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [Device.phone])
        ..addScenario(
          widget: const UserAvatar(name: 'Ivan Avila', imageUrl: null),
          name: 'avatar_sin_imagen',
        );

      // Capturamos la pantalla y verificamos contra el golden
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'user_avatar');
    });
  });

  // Grupo de pruebas para CustomCard
  group('CustomCard Golden Tests', () {
    testGoldens('CustomCard debe verse correctamente', (tester) async {
      // Construimos el widget de prueba
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [Device.phone])
        ..addScenario(
          widget: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                useMaterial3: true,
              ),
              home: const Material(
                child: CustomCard(
                  title: 'Título de Prueba',
                  content: 'Este es un contenido de prueba para el CustomCard',
                ),
              ),
            ),
          ),
          name: 'custom_card_default',
        );

      // Capturamos la pantalla y verificamos contra el golden
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'custom_card');
    });
  });

  // Grupo de pruebas para verificar diferentes temas
  group('Theme Golden Tests', () {
    testGoldens('La aplicación debe verse correctamente con diferentes temas', (
      tester,
    ) async {
      // Definimos una lista de temas para probar
      final themes = [
        ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
      ];

      final themeNames = ['blue_theme', 'red_theme', 'green_theme'];

      // Creamos un builder para capturar cada tema
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [Device.phone]);

      // Agregamos un escenario para cada tema
      for (int i = 0; i < themes.length; i++) {
        builder.addScenario(
          widget: MaterialApp(
            theme: themes[i],
            home: Material(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserAvatar(name: 'Usuario Demo', imageUrl: null),
                    const SizedBox(height: 16),
                    CustomCard(
                      title: 'Tema ${themeNames[i]}',
                      content: 'Este es un ejemplo del tema ${themeNames[i]}',
                    ),
                  ],
                ),
              ),
            ),
          ),
          name: themeNames[i],
        );
      }

      // Capturamos la pantalla y verificamos contra el golden
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, 'theme_variations');
    });
  });
}
