// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginClienteStore on _LoginClienteStoreBase, Store {
  Computed<String?>? _$isValidEmailComputed;

  @override
  String? get isValidEmail =>
      (_$isValidEmailComputed ??= Computed<String?>(() => super.isValidEmail,
              name: '_LoginClienteStoreBase.isValidEmail'))
          .value;
  Computed<String?>? _$isValidSenhaComputed;

  @override
  String? get isValidSenha =>
      (_$isValidSenhaComputed ??= Computed<String?>(() => super.isValidSenha,
              name: '_LoginClienteStoreBase.isValidSenha'))
          .value;

  late final _$emailAtom =
      Atom(name: '_LoginClienteStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: '_LoginClienteStoreBase.senha', context: context);

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$_LoginClienteStoreBaseActionController =
      ActionController(name: '_LoginClienteStoreBase', context: context);

  @override
  void setEmail(String? w) {
    final _$actionInfo = _$_LoginClienteStoreBaseActionController.startAction(
        name: '_LoginClienteStoreBase.setEmail');
    try {
      return super.setEmail(w);
    } finally {
      _$_LoginClienteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String? z) {
    final _$actionInfo = _$_LoginClienteStoreBaseActionController.startAction(
        name: '_LoginClienteStoreBase.setSenha');
    try {
      return super.setSenha(z);
    } finally {
      _$_LoginClienteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
isValidEmail: ${isValidEmail},
isValidSenha: ${isValidSenha}
    ''';
  }
}
