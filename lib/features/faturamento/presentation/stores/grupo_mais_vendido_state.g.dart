// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo_mais_vendido_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GrupoMaisVendidoState on _GrupoMaisVendidoState, Store {
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: '_GrupoMaisVendidoState.hasData'))
      .value;
  Computed<String>? _$chartTitleComputed;

  @override
  String get chartTitle =>
      (_$chartTitleComputed ??= Computed<String>(() => super.chartTitle,
              name: '_GrupoMaisVendidoState.chartTitle'))
          .value;

  late final _$gruposMaisVendidoAtom =
      Atom(name: '_GrupoMaisVendidoState.gruposMaisVendido', context: context);

  @override
  ObservableList<MaisVendidoPorGrupo> get gruposMaisVendido {
    _$gruposMaisVendidoAtom.reportRead();
    return super.gruposMaisVendido;
  }

  @override
  set gruposMaisVendido(ObservableList<MaisVendidoPorGrupo> value) {
    _$gruposMaisVendidoAtom.reportWrite(value, super.gruposMaisVendido, () {
      super.gruposMaisVendido = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_GrupoMaisVendidoState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_GrupoMaisVendidoState.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$_GrupoMaisVendidoStateActionController =
      ActionController(name: '_GrupoMaisVendidoState', context: context);

  @override
  void changeGruposMaisVendido(List<MaisVendidoPorGrupo> list) {
    final _$actionInfo = _$_GrupoMaisVendidoStateActionController.startAction(
        name: '_GrupoMaisVendidoState.changeGruposMaisVendido');
    try {
      return super.changeGruposMaisVendido(list);
    } finally {
      _$_GrupoMaisVendidoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_GrupoMaisVendidoStateActionController.startAction(
        name: '_GrupoMaisVendidoState.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_GrupoMaisVendidoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErrorMessage(String message) {
    final _$actionInfo = _$_GrupoMaisVendidoStateActionController.startAction(
        name: '_GrupoMaisVendidoState.changeErrorMessage');
    try {
      return super.changeErrorMessage(message);
    } finally {
      _$_GrupoMaisVendidoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gruposMaisVendido: ${gruposMaisVendido},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
hasData: ${hasData},
chartTitle: ${chartTitle}
    ''';
  }
}
