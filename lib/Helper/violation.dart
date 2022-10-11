import 'dart:core';

class Violation {
  String name;
  String description;
  String timestamp;
  int severity;

  Violation(this.name, this.description, this.timestamp, this.severity);
}