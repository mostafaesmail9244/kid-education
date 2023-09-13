// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';

/// simple type that will be return from any validation function
typedef Validate = (bool Function(String?), String);

// ----------------------- default validators -------------------------

/// this is default rule to validate password across application
final passwordValidators = [
  require,
  minLen(8),
  maxLen(20),
  atLeast(3, [
    containsLower,
    containsUpper,
    containsDigit,
    containsSpecialSymbols,
  ]),
];

// ------------------------  required validations ------------------------

/// will return true if [value] not null and not empty
final require = (
  (String? value) => value != null && value.isNotEmpty,
  'required',
);

// ----------------------- length validations -------------------------

/// validate that [value as String] length more than or equal to [n]
Validate minLen(int n) {
  return (
    (String? v) => (v == null || v.isEmpty) || (v.trim().length >= n),
    'Can\'t Accept Less Than $n Character',
  );
}

/// validate that [value] length less than or equal to [n]
Validate maxLen(int n) {
  return (
    (String? v) => (v == null || v.isEmpty) || (v.trim().length <= n),
    'Can\'t Accept more Than $n Character',
  );
}

/// validate that [value] length is equal to [n]
Validate length(int n) {
  return (
    (String? v) => (v == null || v.isEmpty) || (v.length == n),
    'Length Must Be Equal $n',
  );
}

// ------------------------ number value validations ------------------------

/// validate that [value as numbers] length more than or equal to [n]
Validate min(num n) {
  return (
    (String? v) {
      if (v == null || v.isEmpty) return true;
      return (num.tryParse(v) ?? -1) >= n;
    },
    'Minimum $n',
  );
}

/// validate that [value] length less than or equal to [n]
Validate max(num n) {
  return (
    (String? v) {
      if (v == null || v.isEmpty) return true;
      return (num.tryParse(v) ?? 1000000) <= n;
    },
    'Maximum $n',
  );
}

// -------------------- type validations ----------------------------

/// will return true if all [value] is characters or space
final onlyCharacters = (
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = '^[a-zA-Z \\u0621-\\u064A]+\$';
    return RegExp(rgx).hasMatch(v.trim());
  },
  'Characters only allowed in this field',
);

/// will return true if all [value] is digits
final onlyDigits = (
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = '^[0-9\\.-]+\$';
    return RegExp(rgx).hasMatch(v.trim());
  },
  'Digits Only (0-9)',
);

// ------------------- contains validation -----------------------------

/// will return true if all [value] contains al least one digit
final containsDigit = (
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = '[0-9]';
    return RegExp(rgx).hasMatch(v.trim());
  },
  'Digits (0-9)',
);

/// will return true if [value] contains at least one lower char
final containsLower = (
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = '[a-z]';
    return RegExp(rgx).hasMatch(v.trim());
  },
  'Lower case characters (a-z)',
);

/// will return true if [value] contains at least one upper char
final containsUpper = (
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = '[A-Z]';
    return RegExp(rgx).hasMatch(v.trim());
  },
  'Upper case characters (A-Z)',
);

/// will return true if [value] contains at least one
/// special symbols `$&+,:;=?@#|<>.^*()%!-`
final containsSpecialSymbols = (
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = r'[$&+,:;=?@#|<>.^*()%!-]';
    return RegExp(rgx).hasMatch(v.trim());
  },
  'Special characters, &+,:;=?@#|<>.^*()%!-',
);

// -------------------- merged validations ----------------------------

/// will return true if at least [number] of [validations] is true
Validate atLeast(int number, List<Validate> validations) {
  final msg = StringBuffer(
    'must contain at least $number of the following: \n',
  );
  for (final v in validations) msg.writeln('  - ${v.$2}');
  return (
    (v) {
      int passed = 0;
      for (final validate in validations) if (validate.$1(v)) passed++;
      return passed >= number;
    },
    msg.toString(),
  );
}

/// will return true if only [number] of [validations] is true
/// not more or less than [number]
Validate only(int number, List<Validate> validations) {
  final msg = StringBuffer(
    'Passwords must contain at least $number of the following: \n',
  );
  for (final v in validations) msg.writeln('  - ${v.$2}');
  return (
    (v) {
      int passed = 0;
      for (final validate in validations) if (validate.$1(v)) passed++;
      return passed == number;
    },
    msg.toString(),
  );
}

// -------------------- phone & email validation ----------------------------

/// validate that [value] is a phone number
final phone = (
  (String? v) {
    if (v == null || v.isEmpty) return false;
    const phoneRegex =
        r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
    return RegExp(phoneRegex).hasMatch(v);
  },
  'Not Valid Phone Format',
);

/// validate that [value] is a email
final email = (
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(rgx).hasMatch(v);
  },
  'Not Correct Email',
);

// ----------------------- content validations -------------------------

/// validate that [value] and [secondValue] is same and not null
Validate isSame(TextEditingController secondValue) {
  return ((String? v) => secondValue.text == v, 'Not Matched');
}
