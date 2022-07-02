// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento_por_mes_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FaturamentoPorMesState on _FaturamentoPorMesState, Store {
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: '_FaturamentoPorMesState.hasData'))
      .value;

  late final _$faturamentoPorMesAtom =
      Atom(name: '_FaturamentoPorMesState.faturamentoPorMes', context: context);

  @override
  ObservableMap<String, List<FaturamentoPorMes>> get faturamentoPorMes {
    _$faturamentoPorMesAtom.reportRead();
    return super.faturamentoPorMes;
  }

  @override
  set faturamentoPorMes(ObservableMap<String, List<FaturamentoPorMes>> value) {
    _$faturamentoPorMesAtom.reportWrite(value, super.faturamentoPorMes, () {
      super.faturamentoPorMes = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FaturamentoPorMesState.isLoading', context: context);

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
      Atom(name: '_FaturamentoPorMesState.errorMessage', context: context);

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

  late final _$_FaturamentoPorMesStateActionController =
      ActionController(name: '_FaturamentoPorMesState', context: context);

  @override
  void changeFaturamentoPorMes(Map<String, List<FaturamentoPorMes>> map) {
    final _$actionInfo = _$_FaturamentoPorMesStateActionController.startAction(
        name: '_FaturamentoPorMesState.changeFaturamentoPorMes');
    try {
      return super.changeFaturamentoPorMes(map);
    } finally {
      _$_FaturamentoPorMesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_FaturamentoPorMesStateActionController.startAction(
        name: '_FaturamentoPorMesState.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_FaturamentoPorMesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErrorMessage(String message) {
    final _$actionInfo = _$_FaturamentoPorMesStateActionController.startAction(
        name: '_FaturamentoPorMesState.changeErrorMessage');
    try {
      return super.changeErrorMessage(message);
    } finally {
      _$_FaturamentoPorMesStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
faturamentoPorMes: ${faturamentoPorMes},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
hasData: ${hasData}
    ''';
  }
}
