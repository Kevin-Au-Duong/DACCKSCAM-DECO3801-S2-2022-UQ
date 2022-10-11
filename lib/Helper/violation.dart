import 'dart:core';

class Violation {
  String name;
  String severity;
  int penalty;
  int occurrences;

  Violation(this.name, this.severity, this.penalty, this.occurrences);
}