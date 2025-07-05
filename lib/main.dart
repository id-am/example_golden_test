import 'package:example_golden_test/models/button_data.dart';
import 'package:example_golden_test/widgets/custom_card.dart';
import 'package:example_golden_test/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Golden Test Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const GoldenTestDemoPage(title: 'Golden Test Demo'),
    );
  }
}

class GoldenTestDemoPage extends StatefulWidget {
  const GoldenTestDemoPage({super.key, required this.title});

  final String title;

  @override
  State<GoldenTestDemoPage> createState() => _GoldenTestDemoPageState();
}

class _GoldenTestDemoPageState extends State<GoldenTestDemoPage> {
  int _selectedTheme = 0;
  final List<ThemeData> _themes = [
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
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    ),
  ];

  final List<ButtonData> _buttons = [
    ButtonData(description: 'Tema Azul', color: Colors.blue),
    ButtonData(description: 'Tema Rojo', color: Colors.red),
    ButtonData(description: 'Tema Verde', color: Colors.green),
  ];

  void _changeTheme(int index) {
    if (index == _selectedTheme) return;
    setState(() {
      _selectedTheme = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themes[_selectedTheme],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                widget.title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const UserAvatar(name: "Usuario Demo", imageUrl: null),
                  const SizedBox(height: 32),
                  const Text(
                    'Demostración de Golden Tests:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const CustomCard(
                    title: "¿Qué son Golden Tests?",
                    content:
                        "Los Golden Tests comparan píxel por píxel tu UI actual con una imagen de referencia 'dorada'.",
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: List.generate(3, (index) {
                      final button = _buttons[index];
                      return ElevatedButton(
                        onPressed: () => _changeTheme(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: button.color,
                        ),
                        child: Text(
                          button.description,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
