<h1 align="center">
  <br>
  <a href="http://www.amitmerchant.com/electron-markdownify"><img src="https://f.hubspotusercontent20.net/hubfs/2829524/Copia%20de%20LOGOTIPO_original-2.png"></a>
  <br>
  Laboratorio Golden Testing
  <br>
</h1>

<h4 align="center">Proyecto base de <a href="https://github.com/karatelabs/karate" target="_blank">Pragma</a>.</h4>

<p align="center"> 
  <img alt="Flutter Version" src="https://img.shields.io/badge/Flutter-3.29+-blue.svg">
  <img alt="License" src="https://img.shields.io/badge/License-MIT-green.svg"> 
</p>

Este proyecto es un ejemplo educativo de cómo implementar pruebas Golden en Flutter utilizando el paquete golden_toolkit. Está diseñado para ayudar a desarrolladores a entender los conceptos fundamentales de las pruebas visuales, comparación de snapshots y validación del aspecto visual de widgets y pantallas a través de diferentes temas y configuraciones.

<p align="center">
  <a href="#topicos">Tópicos</a> •
  <a href="#tecnologias">Tecnologías</a> •
  <a href="#consideraciones">Consideraciones</a> •
  <a href="#descarga">Descarga</a> •
  <a href="#instalación-y-ejecución">Instalación y ejecución</a> •
  <a href="#autores">Autores</a> •
  <a href="#relacionados">Relacionados</a> •
  <a href="#roadmap">Roadmap</a>
</p>

## Tópicos
- <a href="#introducción-a-las-pruebas-golden">Introducción a las Pruebas Golden</a>
- <a href="#golden-toolkit">Golden Toolkit</a>
- <a href="#estructura-del-proyecto">Estructura del Proyecto</a>
- <a href="#organización-de-carpetas">Organización de Carpetas</a>
- <a href="#patrones-de-organización">Patrones de Organización</a>
- <a href="#implementación-de-golden-tests">Implementación de Golden Tests</a>
- <a href="#conceptos-de-testing-demostrados">Conceptos de Testing Demostrados</a>
- <a href="#prácticas-demostradas">Prácticas Demostradas</a>
- <a href="#mejores-prácticas-para-pruebas-golden">Mejores Prácticas</a>
- <a href="#problemas-comunes-y-soluciones">Problemas Comunes y Soluciones</a>

## Introducción a las Pruebas Golden
Las pruebas Golden (o pruebas de captura de pantalla) son una forma de prueba visual que captura una "imagen dorada" de referencia de un widget o pantalla y la utiliza para comparar con futuras versiones del código. A diferencia de las pruebas unitarias o de integración que validan comportamiento y lógica, las pruebas Golden se centran en verificar la apariencia visual de la interfaz de usuario. Este proyecto demuestra cómo implementar pruebas Golden en Flutter, capturando snapshots de widgets en diferentes temas y configuraciones, y comparándolos para verificar la consistencia visual.

## Golden Toolkit
Este proyecto utiliza Golden Toolkit, una biblioteca que proporciona herramientas avanzadas para pruebas de snapshot en Flutter:

- **DeviceBuilder**: Permite probar widgets en múltiples tamaños de dispositivo
- **testGoldens**: Función especializada para ejecutar pruebas Golden
- **screenMatchesGolden**: Compara el estado actual de la UI con una imagen de referencia almacenada

Golden Toolkit ayuda a:
- **Capturar snapshots precisos**: Proporciona herramientas para capturar widgets en condiciones controladas
- **Probar en múltiples dispositivos**: Simula diferentes tamaños y densidades de pantalla
- **Facilitar mantenimiento**: Simplifica el proceso de actualizar imágenes de referencia cuando hay cambios intencionales en la UI
- **Generar documentación visual**: Los snapshots sirven como documentación visual de la aplicación

## Estructura del Proyecto

El proyecto contiene los siguientes componentes principales:

1. **Widgets**: Componentes reutilizables que son el objetivo de las pruebas Golden.
2. **Test Setup**: Configuración inicial para las pruebas Golden, incluyendo inicialización y configuraciones.
3. **Golden Test Config**: Archivo de configuración para personalizar el entorno de prueba Golden.
4. **Golden Tests**: Pruebas visuales que capturan y comparan snapshots de widgets.
5. **Test Models**: Modelos utilizados específicamente para las pruebas.

### Organización de Carpetas

```
example_golden_test/
├── lib/
│   ├── main.dart                       # Punto de entrada de la aplicación
│   ├── models/                         # Modelos de datos
│   │   └── button_data.dart            # Modelo para datos de botones
│   │
│   └── widgets/                        # Widgets reutilizables
│       ├── custom_card.dart            # Widget de tarjeta personalizada
│       └── user_avatar.dart            # Widget de avatar de usuario
│ 
├── test/
│   ├── golden_test_config.dart         # Configuración global para pruebas Golden
│   └── golden_tests/                   # Pruebas Golden
│       └── golden_test_demo_test.dart  # Pruebas Golden para widgets demo
│
├── build/                              # Directorio de compilación (generado)
├── pubspec.yaml                        # Dependencias y configuración del proyecto
└── README.md                           # Documentación del proyecto
```

### Patrones de Organización

#### 1. Estructura por Widgets y Tests Visuales

```
Test Config -> Golden Tests -> Widgets
```

**Ventajas:**
- Facilita la creación y mantenimiento de pruebas visuales
- Mejora la organización de snapshots por componente 
- Permite la reutilización de configuraciones de prueba

#### 2. DeviceBuilder para Múltiples Escenarios

```
DeviceBuilder -> Escenarios -> Widgets en Diferentes Configuraciones
```

**Ventajas:**
- Permite probar widgets en diferentes tamaños de pantalla
- Facilita la comparación visual en múltiples temas
- Organiza los tests por escenarios específicos de uso

## Conceptos de Testing Demostrados

### 1. Pruebas Visuales Basadas en Snapshots
- Captura de snapshots visuales de widgets
- Comparación pixel por pixel contra imágenes de referencia
- Detección de cambios visuales no intencionales

### 2. Pruebas Multi-tema
- Validación de widgets en diferentes temas de color
- Verificación de comportamiento visual consistente
- Pruebas de adaptabilidad a cambios de tema

### 3. DeviceBuilder para Múltiples Escenarios
- Creación de escenarios específicos para cada prueba
- Configuración de diferentes tamaños de dispositivo
- Agrupación de pruebas relacionadas por componente

### 4. Configuración Global de Golden Tests
- Inicialización del entorno para todas las pruebas
- Configuración de fuentes y recursos compartidos
- Personalización de parámetros de comparación visual

## Prácticas Demostradas

1. **Organización de Golden Tests**
   - Uso de `group` para agrupar pruebas por componente
   - Nombres descriptivos que representan el propósito visual del test
   - Uso de `testGoldens` para tests específicos de comparación visual

2. **DeviceBuilder para Escenarios**
   - Creación de múltiples escenarios en un solo test
   - Configuración de dispositivos virtuales con diferentes tamaños
   - Combinación de diferentes variantes de widgets en un mismo test

3. **Pruebas Multi-tema**
   - Validación de widgets bajo diferentes temas de color
   - Verificación de adaptación visual a cambios de tema
   - Pruebas de accesibilidad y contraste en diferentes configuraciones

4. **Pruebas Estables y Reproducibles**
   - Configuración consistente del entorno de pruebas
   - Carga de fuentes y recursos necesarios con `loadAppFonts()`
   - Control sobre sombras y efectos visuales con `enableRealShadows`
   
5. **Separación por Componentes**
   - Pruebas específicas para cada widget visual
   - Validación de componentes individuales y su integración
   - Organización de snapshots por funcionalidad y caso de uso

## Mejores Prácticas para Pruebas Golden

### 1. Configuración Consistente del Entorno

Utiliza un archivo de configuración central para asegurar consistencia entre pruebas:

```dart
// En golden_test_config.dart
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      defaultDevices: [Device.phone],
      enableRealShadows: true,
    ),
  );
}
```

### 2. Uso de DeviceBuilder para Múltiples Escenarios

Utiliza DeviceBuilder para probar widgets en diferentes condiciones:

```dart
final builder = DeviceBuilder()
  ..addScenario(
    widget: MyWidget(enabled: true),
    name: 'enabled_state',
  )
  ..addScenario(
    widget: MyWidget(enabled: false),
    name: 'disabled_state',
  );

await tester.pumpDeviceBuilder(builder);
await screenMatchesGolden(tester, 'my_widget_states');
```

### 3. Organización de Pruebas por Componente

Agrupa pruebas relacionadas para mantener orden en los archivos de golden:

```dart
group('CustomCard Golden Tests', () {
  testGoldens('CustomCard con tema claro', (WidgetTester tester) async {
    // Código de prueba
  });

  testGoldens('CustomCard con tema oscuro', (WidgetTester tester) async {
    // Código de prueba
  });
});
```

### 4. Envolver Widgets en MaterialApp

Envuelve los widgets en MaterialApp para proveer el contexto necesario:

```dart
// Envolver widget de prueba en MaterialApp para obtener tema y contexto
addScenario(
  widget: MaterialApp(
    theme: myTheme,
    home: Material(
      child: MyWidget(),
    ),
  ),
  name: 'my_widget_with_theme',
);
```

### 5. Uso de Nombres Descriptivos para Goldens

Utiliza nombres descriptivos para facilitar la identificación de snapshots:

```dart
await screenMatchesGolden(
  tester, 
  'custom_card_dark_theme_with_long_content',
);
```

### 6. Pruebas Independientes y Atómicas

Cada prueba golden debe ser independiente y enfocarse en un aspecto visual específico:

```dart
// Correcto: Pruebas independientes enfocadas
testGoldens('Avatar sin imagen debe mostrar inicial', (tester) async {
  final builder = DeviceBuilder()
    ..addScenario(
      widget: const UserAvatar(name: 'Test User', imageUrl: null),
      name: 'avatar_with_initial',
    );

  await tester.pumpDeviceBuilder(builder);
  await screenMatchesGolden(tester, 'user_avatar_no_image');
});

testGoldens('Avatar con imagen debe mostrarla correctamente', (tester) async {
  final builder = DeviceBuilder()
    ..addScenario(
      widget: const UserAvatar(name: 'Test User', imageUrl: 'https://example.com/img.jpg'),
      name: 'avatar_with_image',
    );

  await tester.pumpDeviceBuilder(builder);
  await screenMatchesGolden(tester, 'user_avatar_with_image');
});
```

## Implementación de Golden Tests

Los Golden Tests son una metodología para probar la apariencia visual de los widgets que mejora la detección de cambios no intencionales en la UI. En este proyecto, se utilizan Golden Tests para verificar que los componentes visuales se renderizan correctamente bajo diferentes condiciones.

### Estructura de Golden Tests

```
golden_test_config.dart
  └── golden_tests/
      └── golden_test_demo_test.dart (UserAvatar, CustomCard, ThemeTests)
```

### Componentes Clave

#### Configuración Global
```dart
// golden_test_config.dart
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      defaultDevices: [
        Device(name: 'default_phone', size: const Size(400, 800)),
      ],
      enableRealShadows: true,
    ),
  );
}
```

#### Prueba Golden Específica

Una prueba Golden típica utiliza `testGoldens` y `DeviceBuilder` para configurar y capturar snapshots de widgets en diferentes escenarios.

```dart
testGoldens('UserAvatar debe verse correctamente', (tester) async {
  final builder = DeviceBuilder()
    ..overrideDevicesForAllScenarios(devices: [Device.phone])
    ..addScenario(
      widget: const UserAvatar(name: 'Ivan Avila', imageUrl: null),
      name: 'avatar_sin_imagen',
    );

  await tester.pumpDeviceBuilder(builder);
  await screenMatchesGolden(tester, 'user_avatar');
});
```

### Ventajas en la Práctica

1. **Detección Visual**: Los tests identifican cambios visuales que podrían pasar desapercibidos en pruebas de lógica.

2. **Escenarios Múltiples**: Facilita probar widgets en diferentes configuraciones:
   ```dart
   // Probando un componente con diferentes temas
   final builder = DeviceBuilder()
     ..addScenario(
       widget: MaterialApp(
         theme: themeBlue,
         home: MyWidget(),
       ),
       name: 'blue_theme',
     )
     ..addScenario(
       widget: MaterialApp(
         theme: themeRed,
         home: MyWidget(),
       ),
       name: 'red_theme',
     );
   ```

3. **Documentación Visual**: Los snapshots generados actúan como documentación visual de la UI.

4. **Verificación de Temas**: Permiten verificar que los componentes se adaptan correctamente a diferentes temas:
   ```dart
   testGoldens('La aplicación debe verse correctamente con diferentes temas', (tester) async {
     final builder = DeviceBuilder();
     for (int i = 0; i < themes.length; i++) {
       builder.addScenario(
         widget: MaterialApp(theme: themes[i], home: MyScreen()),
         name: themeNames[i],
       );
     }
     await tester.pumpDeviceBuilder(builder);
     await screenMatchesGolden(tester, 'theme_variations');
   });
   ```

## Tecnologías
- [Flutter](https://flutter.dev/) versión 3.29+ - Framework de desarrollo de aplicaciones multiplataforma
- [Dart](https://dart.dev/) - Lenguaje de programación utilizado por Flutter
- [Golden Toolkit](https://pub.dev/packages/golden_toolkit) - Biblioteca para facilitar pruebas Golden en Flutter
- [Flutter Test](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html) - Framework oficial de testing para Flutter
- [Material 3](https://m3.material.io/) - Sistema de diseño implementado en el proyecto

## Consideraciones
- Asegúrate de tener Flutter instalado y configurado en tu máquina.
- Para ejecutar pruebas Golden, se recomienda usar siempre el mismo sistema operativo para generar snapshots consistentes.
- Las pruebas Golden pueden fallar si cambia la configuración visual de tu entorno (tema del sistema, escala, fuentes).
- Ejecutar las pruebas Golden en CI puede requerir configuración adicional para manejar renderizado.
- Este proyecto está diseñado para ser educativo y demostrar buenas prácticas de Golden Testing.

## Descarga

Para clonar esta aplicación desde la línea de comando:

```bash
git clone https://github.com/id-am/example_golden_test.git
cd example_golden_test
```

## Configuración del entorno

Para ejecutar correctamente las pruebas Golden, se debe configurar el archivo golden_test_config.dart:

```dart
// Configurar el tamaño de dispositivo para las pruebas
GoldenToolkitConfiguration(
  defaultDevices: [
    Device(name: 'default_phone', size: const Size(400, 800)),
  ],
)
```

### Actualizar imágenes de referencia

Cuando realizas cambios intencionales en la UI, necesitarás actualizar las imágenes de referencia:

```bash
# Ejecutar las pruebas con la bandera de actualización
flutter test --update-goldens test/golden_tests/golden_test_demo_test.dart
```

### Configuración para diferentes plataformas

Si trabajas en un equipo con diferentes sistemas operativos, puedes crear una estructura de carpetas específica:

```dart
// En golden_test_config.dart
final platform = Platform.operatingSystem;

// Usar una estructura de carpetas por plataforma
GoldenToolkitConfiguration(
  fileNameFactory: (name) => 'goldens/${platform}/$name.png',
)
```



## Instalación y ejecución

Es necesario contar con Flutter instalado y configurado en tu máquina. Puedes seguir la guía de instalación oficial de Flutter [aquí](https://flutter.dev/docs/get-started/install).

```bash
# Descargar dependencias
flutter pub get

# Ejecutar la aplicación
flutter run

# Ejecutar todas las pruebas Golden
flutter test test/golden_tests/

# Ejecutar pruebas específicas Golden
flutter test test/golden_tests/golden_test_demo_test.dart

# Actualizar las imágenes de referencia cuando hay cambios intencionales en la UI
flutter test --update-goldens test/golden_tests/

# Actualizar imágenes de referencia para una prueba específica
flutter test --update-goldens test/golden_tests/golden_test_demo_test.dart
```

## Problemas Comunes y Soluciones

### 1. Diferencias en Plataformas

**Problema**: Los snapshots pueden verse diferentes en distintos sistemas operativos.

**Soluciones**:
- Ejecuta las pruebas Golden en un entorno CI consistente
- Usa configuraciones específicas para cada plataforma
- Establece un convenio de equipo para generar snapshots en un solo entorno

```dart
// En golden_test_config.dart
final isCI = Platform.environment.containsKey('CI');
final platform = Platform.isIOS ? 'ios' : Platform.isAndroid ? 'android' : 'other';

// Configuración específica por plataforma
GoldenToolkitConfiguration(
  fileNameFactory: (name) => 'goldens/${platform}_$name.png',
)
```

### 2. Problemas con Fuentes

**Problema**: Las fuentes pueden verse diferentes o no cargar correctamente.

**Solución**: Asegúrate de cargar las fuentes correctamente en las pruebas:

```dart
// En setup de prueba
await loadAppFonts();

// O configura fuentes específicas para pruebas
MaterialApp(
  theme: ThemeData(
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      // Configuración específica para pruebas
    ),
  ),
  home: widget,
)
```

### 3. Imágenes y Recursos Externos

**Problema**: Los widgets que cargan imágenes externas pueden producir resultados inconsistentes.

**Solución**: Usa mocks para recursos externos o provee imágenes locales para pruebas:

```dart
testGoldens('Widget con imágenes', (tester) async {
  // Usar NetworkImageMock o similar para simular imágenes consistentes
  await tester.pumpWidget(
    MaterialApp(
      home: MyWidget(
        imageProvider: const AssetImage('test/resources/test_image.png'),
      ),
    ),
  );
  await screenMatchesGolden(tester, 'widget_with_image');
});
```

### 4. Variaciones por Tema y Modo

**Problema**: Los cambios de tema o modo oscuro/claro pueden causar falsos positivos.

**Solución**: Crea tests específicos para cada combinación de tema:

```dart
for (final themeName in ['light', 'dark']) {
  testGoldens('Widget en tema $themeName', (tester) async {
    final theme = themeName == 'dark' ? darkTheme : lightTheme;
    
    await tester.pumpWidget(
      MaterialApp(
        theme: theme,
        home: MyWidget(),
      ),
    );
    
    await screenMatchesGolden(tester, 'my_widget_${themeName}_theme');
  });
}
```

### 5. Diferencias de Pixel

**Problema**: Pequeñas diferencias de píxeles causan fallos en las pruebas.

**Soluciones**:
- Ajusta la tolerancia de comparación para permitir pequeñas variaciones
- Usa áreas de interés específicas para tests más precisos
- Considera herramientas como `flutter_test_config.dart` para personalizar la comparación

```dart
// Ajustando tolerancia
await screenMatchesGolden(
  tester, 
  'my_widget',
  customPump: (tester) async {
    await tester.pump(const Duration(milliseconds: 500));
  },
  // Permitir una pequeña tolerancia en las diferencias
  customComparator: (image1, image2) {
    return GoldenFileComparator.compareLists(
      image1, 
      image2,
      tolerance: 0.02, // 2% de tolerancia
    );
  },
);
```

## Autores

[<img src="https://github.com/idamkiller.png" width=115><br><sub>Ivan Dario Avila Martinez</sub>](https://github.com/idamkiller)


## Relacionados
- [Documentación oficial de Golden Toolkit](https://pub.dev/packages/golden_toolkit)
- [Flutter Testing Best Practices](https://flutter.dev/docs/testing/best-practices)
- [Widget Testing en Flutter](https://docs.flutter.dev/testing/testing-framework)
- [Golden File Testing](https://api.flutter.dev/flutter/flutter_test/matchesGoldenFile.html)

## Roadmap
- Unit Testing → Complejidad baja, pruebas de funciones individuales y lógica de negocio.
- Widget Testing → Complejidad media, pruebas de widgets individuales.
- Golden Testing → Complejidad media-alta, pruebas visuales de componentes (Este proyecto).
- Integration Testing → Complejidad alta, pruebas de la aplicación completa.