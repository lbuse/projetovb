import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../cadastro/domain/entities/loja.dart';
import '../../../cadastro/domain/repositories/lojas_repository.dart';
import '../../../cadastro/domain/usecases/get_lojas.dart';

part 'panel_state.g.dart';

class PanelState extends _PanelState with _$PanelState {
  PanelState(LojasRepository repository) {
    _repository = repository;
  }
}

abstract class _PanelState with Store {
  late LojasRepository _repository;
  static String dateFormat = 'dd/MM/yyyy';

  @observable
  DateTime dataInicial = DateTime.now().subtract(const Duration(days: 180));
  @observable
  DateTime dataFinal = DateTime.now();
  @observable
  Loja? lojaSelecionada;
  @observable
  DateTime lastDateFieldsChange = DateTime.now();
  @observable
  DateTime lastLojasChange = DateTime.now();
  @observable
  ObservableList<Loja> lojas = ObservableList<Loja>();
  @observable
  bool isLoading = false;
  @observable
  String errorMessage = '';
  @observable
  bool wasSubmitted = false;

  @computed
  String get dataInicialFormatada => DateFormat(dateFormat).format(dataInicial);
  @computed
  String get dataFinalFormatada => DateFormat(dateFormat).format(dataFinal);
  @computed
  bool get isDataInicialValid => dataInicial.isBefore(dataFinal);
  @computed
  bool get isDataFinalValid => dataFinal.isAfter(dataInicial);
  @computed
  bool get isLojaSelecionadaValid => lojaSelecionada != null;
  @computed
  bool get isDateFieldsValid => isDataInicialValid && isDataFinalValid;
  @computed
  bool get isFormValid =>
      isDataInicialValid && isDataFinalValid && isLojaSelecionadaValid;

  @action
  void changeLojaSelecionada(Loja? value) {
    lojaSelecionada = value;
    changeLastLojasChange();
  }

  @action
  void changeDataInicial(DateTime? value) {
    if (value != null && !value.isAtSameMomentAs(dataFinal)) {
      dataInicial = value;
      changeLastDateFieldsChange();
    }
  }

  @action
  void changeDataFinal(DateTime? value) {
    if (value != null && !value.isAtSameMomentAs(dataFinal)) {
      dataFinal = value;
      changeLastDateFieldsChange();
    }
  }

  @action
  void changeLastDateFieldsChange() => lastDateFieldsChange =
      DateTime.now().subtract(const Duration(seconds: 60));
  @action
  void changeLastLojasChange() => lastLojasChange = DateTime.now();
  @action
  void changeLojas(List<Loja> list) => lojas = ObservableList<Loja>.of(list);
  @action
  void changeIsLoading(bool value) => isLoading = value;
  @action
  void changeErrorMessage(String message) => errorMessage = message;
  @action
  void changeWasSubmitted(bool value) => wasSubmitted = value;

  Future<void> loadLojas() async {
    changeIsLoading(true);
    final getLojas = await GetLojas(_repository)(Params());
    getLojas.fold(
      (failure) => changeErrorMessage(failure.message),
      (lojas) => changeLojas(lojas),
    );
    changeIsLoading(false);
  }
}
