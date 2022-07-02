import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../panel/presentation/stores/panel_state.dart';
import '../../domain/repositories/faturamento_repository.dart';
import '../../domain/usecases/get_pico_atendimento.dart';

part 'pico_atendimento_state.g.dart';

class PicoAtendimentoState extends _PicoAtendimentoState
    with _$PicoAtendimentoState {
  PicoAtendimentoState(FaturamentoRepository repository) {
    _repository = repository;
  }
}

abstract class _PicoAtendimentoState with Store {
  late FaturamentoRepository _repository;
  final PanelState _panelState = GetIt.I.get<PanelState>();

  @observable
  ObservableList<PicoAtendimento> historicoAtendimento =
      ObservableList<PicoAtendimento>();
  @observable
  bool isLoading = false;
  @observable
  String errorMessage = '';

  @computed
  bool get hasData => historicoAtendimento.isNotEmpty;
  @computed
  String get chartTitle {
    String title = 'Picos de atendimento ';
    if (_panelState.lojaSelecionada != null) {
      title += 'da ${_panelState.lojaSelecionada!.nome}';
    }

    return title;
  }

  @action
  void changeFaturamentoPorMes(List<PicoAtendimento> list) =>
      historicoAtendimento = ObservableList<PicoAtendimento>.of(list);
  @action
  void changeIsLoading(bool value) => isLoading = value;
  @action
  void changeErrorMessage(String message) => errorMessage = message;

  Future<void> loadHistoricoAtendimento({
    required DateTime dataInicial,
    required DateTime dataFinal,
    required int idLoja,
  }) async {
    changeIsLoading(true);
    final getFaturamentoPorDia = await GetPicoAtendimento(_repository)(
      Params(
        dataInicial: dataInicial,
        dataFinal: dataFinal,
        lojas: [idLoja],
      ),
    );

    getFaturamentoPorDia.fold(
      (failure) => changeErrorMessage(failure.message),
      (picos) => changeFaturamentoPorMes(picos),
    );
    changeIsLoading(false);
  }
}
