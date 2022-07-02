// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pico_atendimento_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PicoAtendimentoState on _PicoAtendimentoState, Store {
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: '_PicoAtendimentoState.hasData'))
      .value;
  Computed<String>? _$chartTitleComputed;

  @override
  String get chartTitle =>
      (_$chartTitleComputed ??= Computed<String>(() => super.chartTitle,
              name: '_PicoAtendimentoState.chartTitle'))
          .value;

  late final _$historicoAtendimentoAtom = Atom(
      name: '_PicoAtendimentoState.historicoAtendimento', context: context);

  @override
  ObservableList<PicoAtendimento> get historicoAtendimento {
    _$historicoAtendimentoAtom.reportRead();
    return super.historicoAtendimento;
  }

  @override
  set historicoAtendimento(ObservableList<PicoAtendimento> value) {
    _$historicoAtendimentoAtom.reportWrite(value, super.historicoAtendimento,
        () {
      super.historicoAtendimento = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PicoAtendimentoState.isLoading', context: context);

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
      Atom(name: '_PicoAtendimentoState.errorMessage', context: context);

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

  late final _$_PicoAtendimentoStateActionController =
      ActionController(name: '_PicoAtendimentoState', context: context);

  @override
  void changeFaturamentoPorMes(List<PicoAtendimento> list) {
    final _$actionInfo = _$_PicoAtendimentoStateActionController.startAction(
        name: '_PicoAtendimentoState.changeFaturamentoPorMes');
    try {
      return super.changeFaturamentoPorMes(list);
    } finally {
      _$_PicoAtendimentoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_PicoAtendimentoStateActionController.startAction(
        name: '_PicoAtendimentoState.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_PicoAtendimentoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErrorMessage(String message) {
    final _$actionInfo = _$_PicoAtendimentoStateActionController.startAction(
        name: '_PicoAtendimentoState.changeErrorMessage');
    try {
      return super.changeErrorMessage(message);
    } finally {
      _$_PicoAtendimentoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
historicoAtendimento: ${historicoAtendimento},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
hasData: ${hasData},
chartTitle: ${chartTitle}
    ''';
  }
}
