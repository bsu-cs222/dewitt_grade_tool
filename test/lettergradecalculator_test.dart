import 'package:dewitt_grade_tool/lettergradecalculator.dart';
import 'package:test/test.dart';

void main() {
  final data = <double, String>{
    100: "A",
    90: "A",
    80: "B",
    70: "C",
    60: "D",
    50: "F",
    75: "C",
    110: "A",
    93.5: "A"
  };

  for (final entry in data.entries) {
    final numericGrade = entry.key;
    final letterGrade = entry.value;

    test('$numericGrade is a $letterGrade', () {
      final calculator = LetterGradeCalculator();
      String result = calculator.calculateLetterGrade(numericGrade);
      expect(result, letterGrade);
    });
  }
}
