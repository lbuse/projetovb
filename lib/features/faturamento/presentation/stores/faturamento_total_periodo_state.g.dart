// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento_total_periodo_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FaturamentoTotalPeriodoState on _FaturamentoTotalPeriodoState, Store {
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: '_FaturamentoTotalPeriodoState.hasData'))
      .value;

  late final _$faturamentosAtom = Atom(
      name: '_FaturamentoTotalPeriodoState.faturamentos', context: context);

  @override
  ObservableList<FaturamentoTotal> get faturamentos {
    _$faturamentosAtom.reportRead();
    return super.faturamentos;
  }

  @override
  set faturamentos(ObservableList<FaturamentoTotal> value) {
    _$faturamentosAtom.reportWrite(value, super.faturamentos, () {
      super.faturamentos = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FaturamentoTotalPeriodoState.isLoading', context: context);

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

  late final _$errorMessageAtom = Atom(
      name: '_FaturamentoTotalPeriodoState.errorMessage', context: context);

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

  late final _$_FaturamentoTotalPeriodoStateActionController =
      ActionController(name: '_FaturamentoTotalPeriodoState', context: context);

  @override
  void changeFaturamentos(List<FaturamentoTotal> list) {
    final _$actionInfo = _$_FaturamentoTotalPeriodoStateActionController
        .startAction(name: '_FaturamentoTotalPeriodoState.changeFaturamentos');
    try {
      return super.changeFaturamentos(list);
    } finally {
      _$_FaturamentoTotalPeriodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_FaturamentoTotalPeriodoStateActionController
        .startAction(name: '_FaturamentoTotalPeriodoState.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_FaturamentoTotalPeriodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErrorMessage(String message) {
    final _$actionInfo = _$_FaturamentoTotalPeriodoStateActionController
        .startAction(name: '_FaturamentoTotalPeriodoState.changeErrorMessage');
    try {
      return super.changeErrorMessage(message);
    } finally {
      _$_FaturamentoTotalPeriodoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
faturamentos: ${faturamentos},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
hasData: ${hasData}
    ''';
  }
}
