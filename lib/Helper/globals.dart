library frontend.globals;

String? name = 'K-dawg';

int numViolations = 2;

var violations = <Map>[violation1, violation2];

Map violation1 = {'Rule Violation': 'Stop Sign', 
  'Description': 'Failure to Stop', 
  'Severity': 'Major', 
  'Consequences': -100};

Map violation2 = {'Rule Violation': 'Speeding',
  'Description': '90 in 80 Zone (9/s)',
  'Severity': 'Major',
  'Consequences': -90};
