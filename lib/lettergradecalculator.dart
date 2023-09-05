class LetterGradeCalculator {
  String calculateLetterGrade(int numericGrade) {
    if (_isNinetyOrGreater(numericGrade)) {
      return "A";
    } else if (_isEightyOrGreater(numericGrade)) {
      return "B";
    } else if (_isSeventyOrGreater(numericGrade)) {
      return "C";
    } else if (_isSixtyOrGreater(numericGrade)) {
      return "D";
    } else if (_isZeroOrGreater(numericGrade)) {
      return "F";
    } else {
      return "What could you possible have done to get a negative grade?";
    }
  }

  bool _isNinetyOrGreater(int i) {
    if (i >= 90) {
      return true;
    } else {
      return false;
    }
  }

  bool _isEightyOrGreater(int i) {
    if (i >= 80) {
      return true;
    } else {
      return false;
    }
  }

  bool _isSeventyOrGreater(int i) {
    if (i >= 70) {
      return true;
    } else {
      return false;
    }
  }

  bool _isSixtyOrGreater(int i) {
    if (i >= 60) {
      return true;
    } else {
      return false;
    }
  }

  bool _isZeroOrGreater(int i) {
    if (i >= 0) {
      return true;
    } else {
      return false;
    }
  }
}
