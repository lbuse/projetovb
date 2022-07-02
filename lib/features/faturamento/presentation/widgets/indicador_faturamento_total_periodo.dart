import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/widgets/chart_container.dart';
import '../../../panel/presentation/stores/panel_state.dart';
import '../../data/datasources/faturamento_datasource.dart';
import '../../data/repositories/faturamento_repository_impl.dart';
import '../../domain/usecases/get_faturamento_total_periodo.dart';
import '../stores/faturamento_total_periodo_state.dart';

class IndicadorFaturamentoTotalPeriodo extends StatefulWidget {
  const IndicadorFaturamentoTotalPeriodo({Key? key}) : super(key: key);

  @override
  State<IndicadorFaturamentoTotalPeriodo> createState() =>
      _IndicadorFaturamentoTotalPeriodoState();
}

class _IndicadorFaturamentoTotalPeriodoState
    extends State<IndicadorFaturamentoTotalPeriodo> {
  final String _chartTitle = 'Faturamento total no período';
  final FaturamentoTotalPeriodoState _state = FaturamentoTotalPeriodoState(
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
            if (_panelState.isDateFieldsValid) {
              _state.loadFaturamentoTotalPeriodo(
                dataInicial: _panelState.dataInicial,
                dataFinal: _panelState.dataFinal,
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
        chartTitle: _chartTitle,
        isLoading: _state.isLoading,
        hasData: _state.hasData,
        chart: SfCartesianChart(
          title: ChartTitle(text: _chartTitle),
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            labelFormat: 'R\$ {value}',
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ColumnSeries<FaturamentoTotal, String>>[
            ColumnSeries<FaturamentoTotal, String>(
              dataSource: _state.faturamentos,
              xValueMapper: (FaturamentoTotal data, _) => data.loja,
              yValueMapper: (FaturamentoTotal data, _) => data.valorTotal,
              name: 'Faturamento',
            ),
          ],
        ),
        errorMessage: _state.errorMessage,
        onRetry: () => _state.loadFaturamentoTotalPeriodo(
          dataInicial: _panelState.dataInicial,
          dataFinal: _panelState.dataFinal,
        ),
      ),
    );
  }
}
