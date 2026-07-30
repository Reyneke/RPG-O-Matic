/// Severity level of a validation message.
enum ValidationSeverity { info, warning, error }

/// A single validation message.
class ValidationMessage {
  final String field;
  final String message;
  final ValidationSeverity severity;

  const ValidationMessage({
    required this.field,
    required this.message,
    this.severity = ValidationSeverity.error,
  });
}

/// Result of a validation operation.
class ValidationResult {
  final bool isValid;
  final List<ValidationMessage> messages;

  const ValidationResult({
    required this.isValid,
    required this.messages,
  });

  /// Creates a successful validation result.
  factory ValidationResult.success() =>
      const ValidationResult(isValid: true, messages: []);

  /// Creates a failed validation result with messages.
  factory ValidationResult.failure(List<ValidationMessage> messages) =>
      ValidationResult(
        isValid: messages.every((m) => m.severity == ValidationSeverity.info),
        messages: messages,
      );

  List<ValidationMessage> get errors =>
      messages.where((m) => m.severity == ValidationSeverity.error).toList();

  List<ValidationMessage> get warnings =>
      messages.where((m) => m.severity == ValidationSeverity.warning).toList();

  List<ValidationMessage> get infos =>
      messages.where((m) => m.severity == ValidationSeverity.info).toList();
}

/// A validation rule that checks a specific condition.
typedef ValidationRule = ValidationMessage? Function();

/// Validates a character against SR2 rules.
class CharacterValidator {
  /// Validates that a value is within [min] and [max] range.
  static ValidationMessage? validateRange({
    required String field,
    required int value,
    required int min,
    required int max,
  }) {
    if (value < min) {
      return ValidationMessage(
        field: field,
        message: '$field ($value) is below minimum ($min)',
        severity: ValidationSeverity.error,
      );
    }
    if (value > max) {
      return ValidationMessage(
        field: field,
        message: '$field ($value) exceeds maximum ($max)',
        severity: ValidationSeverity.error,
      );
    }
    return null;
  }

  /// Validates that a string value is not empty.
  static ValidationMessage? validateRequired({
    required String field,
    required String? value,
  }) {
    if (value == null || value.isEmpty) {
      return ValidationMessage(
        field: field,
        message: '$field is required',
        severity: ValidationSeverity.error,
      );
    }
    return null;
  }

  /// Validates that total spent points don't exceed maximum.
  static ValidationMessage? validatePoints({
    required String field,
    required int spent,
    required int max,
  }) {
    if (spent > max) {
      return ValidationMessage(
        field: field,
        message: '$field points ($spent) exceed maximum ($max)',
        severity: ValidationSeverity.error,
      );
    }
    return null;
  }

  /// Creates a warning message for a non-critical issue.
  static ValidationMessage? warning({
    required String field,
    required String message,
  }) {
    return ValidationMessage(
      field: field,
      message: message,
      severity: ValidationSeverity.warning,
    );
  }
}