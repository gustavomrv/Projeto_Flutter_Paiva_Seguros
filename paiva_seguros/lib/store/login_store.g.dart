// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginClienteStore on _LoginClienteStoreBase, Store {
  Computed<String?>? _$isValidCpfComputed;

  @override
  String? get isValidCpf =>
      (_$isValidCpfComputed ??= Computed<String?>(() => super.isValidCpf,
              name: '_LoginClienteStoreBase.isValidCpf'))
          .value;
  Computed<String?>? _$isValidSenhaComputed;

  @override
  String? get isValidSenha =>
      (_$isValidSenhaComputed ??= Computed<String?>(() => super.isValidSenha,
              name: '_LoginClienteStoreBase.isValidSenha'))
          .value;

  late final _$cpfAtom =
      Atom(name: '_LoginClienteStoreBase.cpf', context: context);

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
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
  void setCpf(String? w) {
    final _$actionInfo = _$_LoginClienteStoreBaseActionController.startAction(
        name: '_LoginClienteStoreBase.setCpf');
    try {
      return super.setCpf(w);
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
cpf: ${cpf},
senha: ${senha},
isValidCpf: ${isValidCpf},
isValidSenha: ${isValidSenha}
    ''';
  }
}
