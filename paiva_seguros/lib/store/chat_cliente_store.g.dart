// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_cliente_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatClienteStore on _ChatClienteStoreBase, Store {
  Computed<String?>? _$isValidTextoComputed;

  @override
  String? get isValidTexto =>
      (_$isValidTextoComputed ??= Computed<String?>(() => super.isValidTexto,
              name: '_ChatClienteStoreBase.isValidTexto'))
          .value;

  late final _$textoAtom =
      Atom(name: '_ChatClienteStoreBase.texto', context: context);

  @override
  String? get texto {
    _$textoAtom.reportRead();
    return super.texto;
  }

  @override
  set texto(String? value) {
    _$textoAtom.reportWrite(value, super.texto, () {
      super.texto = value;
    });
  }

  late final _$_ChatClienteStoreBaseActionController =
      ActionController(name: '_ChatClienteStoreBase', context: context);

  @override
  void setTexto(String? t) {
    final _$actionInfo = _$_ChatClienteStoreBaseActionController.startAction(
        name: '_ChatClienteStoreBase.setTexto');
    try {
      return super.setTexto(t);
    } finally {
      _$_ChatClienteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
texto: ${texto},
isValidTexto: ${isValidTexto}
    ''';
  }
}
