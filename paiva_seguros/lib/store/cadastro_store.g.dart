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
  String toString() {
    return '''
nome: ${nome},
isValidName: ${isValidName}
    ''';
  }
}
