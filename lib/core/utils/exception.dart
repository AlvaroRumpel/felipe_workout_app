import 'dart:developer';

class CustomException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final Object? error;

  CustomException({
    required this.message,
    this.stackTrace,
    this.error,
  }) {
    log(message, stackTrace: stackTrace, error: error);
  }

  @override
  String toString() => message;
}

class InvalidEmailException extends CustomException {
  InvalidEmailException({
    super.message = 'E-mail inválido, revise os dados',
    super.stackTrace,
    super.error,
  });
}

class UserDisabledException extends CustomException {
  UserDisabledException({
    super.message = 'Usuário está inativado, insira outro e-mail',
    super.stackTrace,
    super.error,
  });
}

class UserNotFoundException extends CustomException {
  UserNotFoundException({
    super.message = 'Usuário não encontrado, verifique os dados',
    super.stackTrace,
    super.error,
  });
}

class WrongPasswordException extends CustomException {
  WrongPasswordException({
    super.message = 'Senha incorreta, verifique seus dados',
    super.stackTrace,
    super.error,
  });
}

class WrongDataException extends CustomException {
  WrongDataException({
    super.message = 'Informações incorretas, verifique os dados',
    super.stackTrace,
    super.error,
  });
}

class EmailAlreadyInUseException extends CustomException {
  EmailAlreadyInUseException({
    super.message = 'Já existe uma conta com este endereço e-mail',
    super.stackTrace,
    super.error,
  });
}

class OperationNotAllowedException extends CustomException {
  OperationNotAllowedException({
    super.message = 'Operação não permitida, está conta está desabilitada',
    super.stackTrace,
    super.error,
  });
}

class WeakPasswordException extends CustomException {
  WeakPasswordException({
    super.message = 'A senha não é forte o suficiente',
    super.stackTrace,
    super.error,
  });
}

class AuthException extends CustomException {
  AuthException({
    required super.message,
    super.stackTrace,
    super.error,
  });
}

class LocalStorageSaveException extends CustomException {
  LocalStorageSaveException({
    super.message = 'Não foi possível salvar!',
    super.stackTrace,
    super.error,
  });
}

class LocalStorageGetException extends CustomException {
  LocalStorageGetException({
    super.message = 'Não foi possível buscar!',
    super.stackTrace,
    super.error,
  });
}

class GoogleSheetSaveException extends CustomException {
  GoogleSheetSaveException({
    super.message = 'Não foi possível salvar!',
    super.stackTrace,
    super.error,
  });
}

class GoogleSheetGetException extends CustomException {
  GoogleSheetGetException({
    super.message = 'Não foi possível buscar!',
    super.stackTrace,
    super.error,
  });
}
