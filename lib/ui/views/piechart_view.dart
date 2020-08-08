import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/viewmodels/piechart_model.dart';
import 'package:moneymanager/ui/views/base_view.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartView extends StatelessWidget {
  const PieChartView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PieChartModel>(
      onModelReady: (model) => model.init(true),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Chart'),
        ),
        body: model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: <Widget>[
                        ChipsChoice<int>.single(
                          itemConfig: ChipsChoiceItemConfig(
                              elevation: 1, selectedColor: Colors.red),
                          value: model.selectedMonthIndex,
                          isWrapped: true,
                          options: ChipsChoiceOption.listFrom<int, String>(
                            source: model.months,
                            value: (i, v) => i,
                            label: (i, v) => v,
                          ),
                          onChanged: (val) => model.changeSelectedMonth(val),
                        ),
                        ChipsChoice<int>.single(
                          itemConfig: ChipsChoiceItemConfig(
                              elevation: 1, selectedColor: Colors.green),
                          value: model.type == 'income' ? 0 : 1,
                          isWrapped: true,
                          options: ChipsChoiceOption.listFrom<int, String>(
                            source: model.types,
                            value: (i, v) => i,
                            label: (i, v) => v,
                          ),
                          onChanged: (val) => model.changeType(val),
                        ),
                        model.dataMap.length == 0
                            ? Text('No Data for this month')
                            : PieChart(dataMap: model.dataMap),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
