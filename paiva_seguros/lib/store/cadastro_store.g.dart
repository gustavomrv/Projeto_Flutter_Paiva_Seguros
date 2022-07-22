// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastroClienteStore on _CadastroClienteStoreBase, Store {
  Computed<String?>? _$isValidNameComputed;

  @override
  String? get isValidName =>
      (_$isValidNameComputed ??= Computed<String?>(() => super.isValidName,
              name: '_CadastroClienteStoreBase.isValidName'))
          .value;
  Computed<String?>? _$isValidCpfComputed;

  @override
  String? get isValidCpf =>
      (_$isValidCpfComputed ??= Computed<String?>(() => super.isValidCpf,
              name: '_CadastroClienteStoreBase.isValidCpf'))
          .value;
  Computed<String?>? _$isValidEmailComputed;

  @override
  String? get isValidEmail =>
      (_$isValidEmailComputed ??= Computed<String?>(() => super.isValidEmail,
              name: '_CadastroClienteStoreBase.isValidEmail'))
          .value;
  Computed<String?>? _$isValidTelefoneComputed;

  @override
  String? get isValidTelefone => (_$isValidTelefoneComputed ??=
          Computed<String?>(() => super.isValidTelefone,
              name: '_CadastroClienteStoreBase.isValidTelefone'))
      .value;
  Computed<String?>? _$isValidSenhaComputed;

  @override
  String? get isValidSenha =>
      (_$isValidSenhaComputed ??= Computed<String?>(() => super.isValidSenha,
              name: '_CadastroClienteStoreBase.isValidSenha'))
          .value;

  late final _$nomeAtom =
      Atom(name: '_CadastroClienteStoreBase.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$cpfAtom =
      Atom(name: '_CadastroClienteStoreBase.cpf', context: context);

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

  late final _$emailAtom =
      Atom(name: '_CadastroClienteStoreBase.email', context: context);

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

  late final _$telefoneAtom =
      Atom(name: '_CadastroClienteStoreBase.telefone', context: context);

  @override
  String? get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String? value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: '_CadastroClienteStoreBase.senha', context: context);

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

  late final _$_CadastroClienteStoreBaseActionController =
      ActionController(name: '_CadastroClienteStoreBase', context: context);

  @override
  void setNome(String? v) {
    final _$actionInfo = _$_CadastroClienteStoreBaseActionController
        .startAction(name: '_CadastroClienteStoreBase.setNome');
    try {
      return super.setNome(v);
    } finally {
      _$_CadastroClienteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String? w) {
    final _$actionInfo = _$_CadastroClienteStoreBaseActionController
        .startAction(name: '_CadastroClienteStoreBase.setCpf');
    try {
      return super.setCpf(w);
    } finally {
      _$_CadastroClienteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String? x) {
    final _$actionInfo = _$_CadastroClienteStoreBaseActionController
        .startAction(name: '_CadastroClienteStoreBase.setEmail');
    try {
      return super.setEmail(x);
    } finally {
      _$_CadastroClienteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String? y) {
    final _$actionInfo = _$_CadastroClienteStoreBaseActionController
        .startAction(name: '_CadastroClienteStoreBase.setTelefone');
    try {
      return super.setTelefone(y);
    } finally {
      _$_CadastroClienteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String? z) {
    final _$actionInfo = _$_CadastroClienteStoreBaseActionController
        .startAction(name: '_CadastroClienteStoreBase.setSenha');
    try {
      return super.setSenha(z);
    } finally {
      _$_CadastroClienteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
cpf: ${cpf},
email: ${email},
telefone: ${telefone},
senha: ${senha},
isValidName: ${isValidName},
isValidCpf: ${isValidCpf},
isValidEmail: ${isValidEmail},
isValidTelefone: ${isValidTelefone},
isValidSenha: ${isValidSenha}
    ''';
  }
}
