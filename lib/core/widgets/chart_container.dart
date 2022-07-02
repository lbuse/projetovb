import 'package:flutter/material.dart';

class ChartContainer extends StatelessWidget {
  const ChartContainer({
    Key? key,
    required this.chartTitle,
    required this.isLoading,
    required this.hasData,
    required this.chart,
    this.errorMessage,
    this.onRetry,
  }) : super(key: key);

  final String chartTitle;
  final bool isLoading;
  final bool hasData;
  final Widget chart;
  final String? errorMessage;
  final void Function()? onRetry;

  bool get hasError => errorMessage != null && errorMessage!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isLoading
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      chartTitle,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 18.0,
                          fontFamily: 'Segoe UI',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : hasData
                ? chart
                : _buildErrorMessage(context),
      ),
    );
  }

  Widget _buildErrorMessage(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            chartTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 18.0,
                fontFamily: 'Segoe UI',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                hasError
                    ? errorMessage!
                    : 'Nenhum dado disponível para o filtro aplicado',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: 'Segoe UI',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).errorColor,
                    ),
              ),
              if (onRetry != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: Theme.of(context).primaryColor,
                    ),
                    tooltip: 'Recarregar',
                    onPressed: onRetry,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
