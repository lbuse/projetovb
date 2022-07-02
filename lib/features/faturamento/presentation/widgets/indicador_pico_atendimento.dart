import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vidado/features/faturamento/domain/usecases/get_pico_atendimento.dart';

import '../../../../core/widgets/chart_container.dart';
import '../../../panel/presentation/stores/panel_state.dart';
import '../../data/datasources/faturamento_datasource.dart';
import '../../data/repositories/faturamento_repository_impl.dart';
import '../stores/pico_atendimento_state.dart';

class IndicadorPicoAtendimento extends StatefulWidget {
  const IndicadorPicoAtendimento({Key? key}) : super(key: key);

  @override
  State<IndicadorPicoAtendimento> createState() =>
      _IndicadorPicoAtendimentoState();
}

class _IndicadorPicoAtendimentoState extends State<IndicadorPicoAtendimento> {
  final PicoAtendimentoState state = PicoAtendimentoState(
    FaturamentoRepositoryImpl(
      FaturamentoDatasourceImpl(http.Client()),
    ),
  );
  final List<ReactionDisposer> _disposers = [];
  final PanelState _panelState = GetIt.I.get<PanelState>();

  @override
  void initState() {
    super.initState();
    if (_disposers.isEmpty) {
      _disposers.addAll([
        reaction<DateTime>(
          (_) => _panelState.lastDateFieldsChange,
          (_) {
            if (_panelState.isFormValid) {
              state.loadHistoricoAtendimento(
                dataInicial: _panelState.dataInicial,
                dataFinal: _panelState.dataFinal,
                idLoja: _panelState.lojaSelecionada!.id,
              );
            }
          },
        ),
        reaction<DateTime>(
          (_) => _panelState.lastLojasChange,
          (_) {
            if (_panelState.isFormValid) {
              state.loadHistoricoAtendimento(
                dataInicial: _panelState.dataInicial,
                dataFinal: _panelState.dataFinal,
                idLoja: _panelState.lojaSelecionada!.id,
              );
            }
          },
        ),
      ]);
    }
  }

  @override
  void dispose() {
    for (ReactionDisposer dispose in _disposers) {
      dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ChartContainer(
        chartTitle: state.chartTitle,
        isLoading: state.isLoading,
        hasData: state.hasData,
        chart: SfCartesianChart(
          title: ChartTitle(text: state.chartTitle),
          legend: Legend(isVisible: true),
          primaryXAxis: CategoryAxis(
            title: AxisTitle(text: 'Horários'),
          ),
          primaryYAxis: NumericAxis(),
          tooltipBehavior: TooltipBehavior(
            enable: true,
          ),
          series: <ColumnSeries>[
            ColumnSeries<PicoAtendimento, String>(
              dataSource: state.historicoAtendimento,
              xValueMapper: (PicoAtendimento pico, _) =>
                  '${formatHorario(pico.data)}h',
              yValueMapper: (PicoAtendimento pico, _) => pico.pessoasAtendidas,
              name: 'Pessoas Atendidas',
            )
          ],
        ),
        errorMessage: state.errorMessage,
        onRetry: () => state.loadHistoricoAtendimento(
          dataInicial: _panelState.dataInicial,
          dataFinal: _panelState.dataFinal,
          idLoja: _panelState.lojaSelecionada!.id,
        ),
      ),
    );
  }

  static String formatHorario(DateTime horario) {
    final f = DateFormat('h');
    return f.format(horario);
  }
}
