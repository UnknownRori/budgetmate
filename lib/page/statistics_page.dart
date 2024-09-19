import 'package:budget_mate/models/transaction.dart';
import 'package:budget_mate/utils/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Statistics',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return StatisticsMobile();
          } else if (constraints.maxWidth <= 1200) {
            return StatisticsDesktop(gridCount: 4);
          } else {
            return StatisticsDesktop(gridCount: 6);
          }
        },
      ),
    );
  }
}

class StatisticsDesktop extends StatefulWidget {
  final int gridCount;
  const StatisticsDesktop({super.key, required this.gridCount});

  @override
  _StatisticsDesktopState createState() =>
      _StatisticsDesktopState(gridCount: gridCount);
}

class _StatisticsDesktopState extends State<StatisticsDesktop> {
  final int gridCount;
  _StatisticsDesktopState({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    final transactionRepo = Provider.of<TransactionRepository>(context);
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');
    final topSpendings = transactionRepo.sumExpenseByCategory();

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 500,
          padding: mobile.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  FilledButton(
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Not implemented yet!"),
                              duration: Duration(seconds: 1),
                            ),
                          ),
                      child: Text("Spendings", style: mobile.text)),
                  const SizedBox(width: 16),
                  OutlinedButton(
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Not implemented yet!"),
                              duration: Duration(seconds: 1),
                            ),
                          ),
                      child: Text("Income", style: mobile.text)),
                ],
              ),
              // TODO : Make it correspond with the data
              Expanded(
                child: LineChart(
                  lineChartData(),
                ),
              ),
              const SizedBox(height: 26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Spending", style: mobile.textMidBold),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Center(
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: gridCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: topSpendings.map((item) {
                      final String itemAmount = formatter.format(item.amount);

                      return Card(
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Icon(item.getCategoryIcon(), size: 46),
                                Text(item.category, style: mobile.text),
                                item.type == TransactionType.income
                                    ? Text(itemAmount, style: mobile.text)
                                    : Text(itemAmount,
                                        style: mobile.textDanger),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData lineChartData() {
    return LineChartData(
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 4),
            FlSpot(2.6, 5),
            FlSpot(4.9, 1),
            FlSpot(6.8, 2),
            FlSpot(8, 3),
            FlSpot(9.5, 4),
            FlSpot(11, 5),
          ],
          isCurved: true,
          color: Colors.red.withOpacity(0.2),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: const Alignment(0.5, 0.0),
              end: const Alignment(0.5, 1.0),
              colors: [
                Colors.red.withOpacity(0.4),
                Colors.red.withOpacity(0.7),
              ],
            ),
          ),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: Colors.green.withOpacity(0.2),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: const Alignment(0.5, 0.0),
              end: const Alignment(0.5, 1.0),
              colors: [
                Colors.green.withOpacity(0.4),
                Colors.green.withOpacity(0.7),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}

class StatisticsMobile extends StatefulWidget {
  @override
  _StatisticsMobileState createState() => _StatisticsMobileState();
}

class _StatisticsMobileState extends State<StatisticsMobile> {
  @override
  Widget build(BuildContext context) {
    final transactionRepo = Provider.of<TransactionRepository>(context);
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');
    final topSpendings = transactionRepo.sumExpenseByCategory();

    return SafeArea(
      child: Padding(
        padding: mobile.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FilledButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Not implemented yet!"),
                            duration: Duration(seconds: 1),
                          ),
                        ),
                    child: Text("Spendings", style: mobile.text)),
                const SizedBox(width: 16),
                OutlinedButton(
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Not implemented yet!"),
                            duration: Duration(seconds: 1),
                          ),
                        ),
                    child: Text("Income", style: mobile.text)),
              ],
            ),
            // TODO : Make it correspond with the data
            Expanded(
              child: LineChart(
                lineChartData(),
              ),
            ),
            const SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top Spending", style: mobile.textMidBold),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: topSpendings.length,
                  itemBuilder: (context, index) {
                    final item = topSpendings[index];

                    final String itemAmount = formatter.format(item.amount);
                    return Card(
                      elevation: 4,
                      child: InkWell(
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Not implemented yet!"),
                            duration: Duration(seconds: 1),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(item.getCategoryIcon()),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(item.category, style: mobile.text),
                              ),
                              Expanded(
                                flex: 3,
                                child: item.type == TransactionType.income
                                    ? Text(itemAmount, style: mobile.text)
                                    : Text(itemAmount,
                                        style: mobile.textDanger),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData lineChartData() {
    return LineChartData(
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 4),
            FlSpot(2.6, 5),
            FlSpot(4.9, 1),
            FlSpot(6.8, 2),
            FlSpot(8, 3),
            FlSpot(9.5, 4),
            FlSpot(11, 5),
          ],
          isCurved: true,
          color: Colors.red.withOpacity(0.2),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: const Alignment(0.5, 0.0),
              end: const Alignment(0.5, 1.0),
              colors: [
                Colors.red.withOpacity(0.4),
                Colors.red.withOpacity(0.7),
              ],
            ),
          ),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: Colors.green.withOpacity(0.2),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: const Alignment(0.5, 0.0),
              end: const Alignment(0.5, 1.0),
              colors: [
                Colors.green.withOpacity(0.4),
                Colors.green.withOpacity(0.7),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
