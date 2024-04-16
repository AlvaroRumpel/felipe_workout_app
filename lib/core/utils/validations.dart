abstract interface class Validation {
  final String message;

  Validation({required this.message});

  String? validate(String? value);
}

class Required extends Validation {
  Required({super.message = 'Campo obrigatório'});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return message;
    }

    return null;
  }
}

class Email extends Validation {
  Email({super.message = 'E-mail inválido'});

  @override
  String? validate(String? value) {
    if (value != null &&
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return message;
    }

    return null;
  }
}

class Password extends Validation {
  Password({super.message = 'Senha inválida'});

  @override
  String? validate(String? value) {
    if (value != null &&
        !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$')
            .hasMatch(value)) {
      return message;
    }

    return null;
  }
}

class Custom extends Validation {
  Custom({
    required this.validation,
  }) : super(message: '');

  String? Function(String?) validation;

  @override
  String? validate(String? value) {
    return validation(value);
  }
}

extension Validate on List<Validation> {
  String? validate(String? value) {
    var errors = <String?>[];
    for (var validation in this) {
      errors.add(validation.validate(value));
    }

    return errors.firstWhere((element) => element != null, orElse: () => null);
  }
}
