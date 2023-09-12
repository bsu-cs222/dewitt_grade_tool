import 'package:dewitt_grade_tool/lettergradecalculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Grade Tool'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();
  String _letterGrade = "";

  void _calculateLetterGrade() {
    final calculator = LetterGradeCalculator();
    String input = controller.text;

    if (input.substring(input.length - 1) == "%") {
      input = input.substring(0, input.length - 1);
    }

    final percentageGrade = double.tryParse(input);

    if (percentageGrade == null) {
    } else {
      _letterGrade = calculator.calculateLetterGrade(percentageGrade);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 360,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your percentage grade',
                ),
                controller: controller,
                onEditingComplete: () {
                  setState(() {
                    _calculateLetterGrade();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _calculateLetterGrade();
                  });
                },
                child: Text('Calculate your letter grade'),
              ),
            ),
            const Text(
              'Your letter grade is:',
            ),
            Text(
              _letterGrade,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
    );
  }
}
