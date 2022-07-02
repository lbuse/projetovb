// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panel_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PanelState on _PanelState, Store {
  Computed<String>? _$dataInicialFormatadaComputed;

  @override
  String get dataInicialFormatada => (_$dataInicialFormatadaComputed ??=
          Computed<String>(() => super.dataInicialFormatada,
              name: '_PanelState.dataInicialFormatada'))
      .value;
  Computed<String>? _$dataFinalFormatadaComputed;

  @override
  String get dataFinalFormatada => (_$dataFinalFormatadaComputed ??=
          Computed<String>(() => super.dataFinalFormatada,
              name: '_PanelState.dataFinalFormatada'))
      .value;
  Computed<bool>? _$isDataInicialValidComputed;

  @override
  bool get isDataInicialValid => (_$isDataInicialValidComputed ??=
          Computed<bool>(() => super.isDataInicialValid,
              name: '_PanelState.isDataInicialValid'))
      .value;
  Computed<bool>? _$isDataFinalValidComputed;

  @override
  bool get isDataFinalValid => (_$isDataFinalValidComputed ??= Computed<bool>(
          () => super.isDataFinalValid,
          name: '_PanelState.isDataFinalValid'))
      .value;
  Computed<bool>? _$isLojaSelecionadaValidComputed;

  @override
  bool get isLojaSelecionadaValid => (_$isLojaSelecionadaValidComputed ??=
          Computed<bool>(() => super.isLojaSelecionadaValid,
              name: '_PanelState.isLojaSelecionadaValid'))
      .value;
  Computed<bool>? _$isDateFieldsValidComputed;

  @override
  bool get isDateFieldsValid => (_$isDateFieldsValidComputed ??= Computed<bool>(
          () => super.isDateFieldsValid,
          name: '_PanelState.isDateFieldsValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_PanelState.isFormValid'))
          .value;

  late final _$dataInicialAtom =
      Atom(name: '_PanelState.dataInicial', context: context);

  @override
  DateTime get dataInicial {
    _$dataInicialAtom.reportRead();
    return super.dataInicial;
  }

  @override
  set dataInicial(DateTime value) {
    _$dataInicialAtom.reportWrite(value, super.dataInicial, () {
      super.dataInicial = value;
    });
  }

  late final _$dataFinalAtom =
      Atom(name: '_PanelState.dataFinal', context: context);

  @override
  DateTime get dataFinal {
    _$dataFinalAtom.reportRead();
    return super.dataFinal;
  }

  @override
  set dataFinal(DateTime value) {
    _$dataFinalAtom.reportWrite(value, super.dataFinal, () {
      super.dataFinal = value;
    });
  }

  late final _$lojaSelecionadaAtom =
      Atom(name: '_PanelState.lojaSelecionada', context: context);

  @override
  Loja? get lojaSelecionada {
    _$lojaSelecionadaAtom.reportRead();
    return super.lojaSelecionada;
  }

  @override
  set lojaSelecionada(Loja? value) {
    _$lojaSelecionadaAtom.reportWrite(value, super.lojaSelecionada, () {
      super.lojaSelecionada = value;
    });
  }

  late final _$lastDateFieldsChangeAtom =
      Atom(name: '_PanelState.lastDateFieldsChange', context: context);

  @override
  DateTime get lastDateFieldsChange {
    _$lastDateFieldsChangeAtom.reportRead();
    return super.lastDateFieldsChange;
  }

  @override
  set lastDateFieldsChange(DateTime value) {
    _$lastDateFieldsChangeAtom.reportWrite(value, super.lastDateFieldsChange,
        () {
      super.lastDateFieldsChange = value;
    });
  }

  late final _$lastLojasChangeAtom =
      Atom(name: '_PanelState.lastLojasChange', context: context);

  @override
  DateTime get lastLojasChange {
    _$lastLojasChangeAtom.reportRead();
    return super.lastLojasChange;
  }

  @override
  set lastLojasChange(DateTime value) {
    _$lastLojasChangeAtom.reportWrite(value, super.lastLojasChange, () {
      super.lastLojasChange = value;
    });
  }

  late final _$lojasAtom = Atom(name: '_PanelState.lojas', context: context);

  @override
  ObservableList<Loja> get lojas {
    _$lojasAtom.reportRead();
    return super.lojas;
  }

  @override
  set lojas(ObservableList<Loja> value) {
    _$lojasAtom.reportWrite(value, super.lojas, () {
      super.lojas = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PanelState.isLoading', context: context);

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
      Atom(name: '_PanelState.errorMessage', context: context);

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

  late final _$wasSubmittedAtom =
      Atom(name: '_PanelState.wasSubmitted', context: context);

  @override
  bool get wasSubmitted {
    _$wasSubmittedAtom.reportRead();
    return super.wasSubmitted;
  }

  @override
  set wasSubmitted(bool value) {
    _$wasSubmittedAtom.reportWrite(value, super.wasSubmitted, () {
      super.wasSubmitted = value;
    });
  }

  late final _$_PanelStateActionController =
      ActionController(name: '_PanelState', context: context);

  @override
  void changeLojaSelecionada(Loja? value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeLojaSelecionada');
    try {
      return super.changeLojaSelecionada(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDataInicial(DateTime? value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeDataInicial');
    try {
      return super.changeDataInicial(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDataFinal(DateTime? value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeDataFinal');
    try {
      return super.changeDataFinal(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLastDateFieldsChange() {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeLastDateFieldsChange');
    try {
      return super.changeLastDateFieldsChange();
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLastLojasChange() {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeLastLojasChange');
    try {
      return super.changeLastLojasChange();
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLojas(List<Loja> list) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeLojas');
    try {
      return super.changeLojas(list);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeErrorMessage(String message) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeErrorMessage');
    try {
      return super.changeErrorMessage(message);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeWasSubmitted(bool value) {
    final _$actionInfo = _$_PanelStateActionController.startAction(
        name: '_PanelState.changeWasSubmitted');
    try {
      return super.changeWasSubmitted(value);
    } finally {
      _$_PanelStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataInicial: ${dataInicial},
dataFinal: ${dataFinal},
lojaSelecionada: ${lojaSelecionada},
lastDateFieldsChange: ${lastDateFieldsChange},
lastLojasChange: ${lastLojasChange},
lojas: ${lojas},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
wasSubmitted: ${wasSubmitted},
dataInicialFormatada: ${dataInicialFormatada},
dataFinalFormatada: ${dataFinalFormatada},
isDataInicialValid: ${isDataInicialValid},
isDataFinalValid: ${isDataFinalValid},
isLojaSelecionadaValid: ${isLojaSelecionadaValid},
isDateFieldsValid: ${isDateFieldsValid},
isFormValid: ${isFormValid}
    ''';
  }
}
