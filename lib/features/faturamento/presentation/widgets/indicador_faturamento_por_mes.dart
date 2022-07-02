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
import '../../domain/entities/faturamento_por_mes.dart';
import '../stores/faturamento_por_mes_state.dart';

class IndicadorFaturamentoPorMes extends StatefulWidget {
  const IndicadorFaturamentoPorMes({Key? key}) : super(key: key);

  @override
  State<IndicadorFaturamentoPorMes> createState() =>
      _IndicadorFaturamentoPorMesState();
}

class _IndicadorFaturamentoPorMesState
    extends State<IndicadorFaturamentoPorMes> {
  final String _chartTitle = 'Faturamento por Mês';
  final FaturamentoPorMesState _state = FaturamentoPorMesState(
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
              _state.loadFaturamentoPorMes(
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
      builder: (_) => ChartContainer(
        chartTitle: _chartTitle,
        isLoading: _state.isLoading,
        hasData: _state.hasData,
        chart: SfCartesianChart(
          title: ChartTitle(text: _chartTitle),
          legend: Legend(isVisible: true),
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(
            labelFormat: 'R\$ {value}',
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: _state.faturamentoPorMes
              .map((loja, faturamentos) {
                return MapEntry(
                  loja,
                  LineSeries<FaturamentoPorMes, int>(
                    dataSource: faturamentos,
                    xValueMapper: (FaturamentoPorMes data, _) => data.mes,
                    yValueMapper: (FaturamentoPorMes data, _) =>
                        data.precoTotal,
                    name: loja,
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                );
              })
              .values
              .toList(),
        ),
        errorMessage: _state.errorMessage,
        onRetry: () => _state.loadFaturamentoPorMes(
          dataInicial: _panelState.dataInicial,
          dataFinal: _panelState.dataFinal,
        ),
      ),
    );
  }
}
