import 'package:flutter/material.dart';
import 'package:moneymanager/core/viewmodels/home_model.dart';

import 'package:moneymanager/ui/views/base_view.dart';
import 'package:moneymanager/ui/widgets/app_drawer.dart';
import 'package:moneymanager/ui/widgets/busy_overlay.dart';
import 'package:overlay_container/overlay_container.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: getAppBar(model.appBarTitle, model),
        drawer: AppDrawer(context),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
                Text('Transactions'),
              ],
            ),
            model.isCollabsed
                ? buildOverlayPicker(model.isCollabsed, model, context)
                : Container(),
          ],
        ),
      ),
    );
  }

  buildOverlayPicker(showOrHide, HomeModel model, BuildContext context) {
    return OverlayContainer(
        show: showOrHide,
        // Let's position this overlay to the right of the button.
        position: OverlayContainerPosition(
          // Left position.
          0,
          // Bottom position.
          0,
        ),
        // The content inside the overlay.
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 3,
                spreadRadius: 10,
              )
            ],
          ),
          child: buildGridView(model),
        ));
  }

  Widget buildGridView(HomeModel model) {
    return GridView.count(
      crossAxisCount: 6,
      // Generate 100 widgets that display their index in the List.
      children: model.months.map((month) {
        return InkWell(
          onTap: () {
            model.monthClicked(month);
          },
          child: Center(
            child: Text(
              month,
              style: TextStyle(
                color: getColor(month, model.selectedMonthIndex, model.months),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  getAppBar(String title, HomeModel model) {
    return AppBar(
      title: InkWell(
        onTap: () {
          model.titleClicked();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              model.isCollabsed
                  ? Icon(
                      Icons.arrow_drop_down,
                    )
                  : Icon(
                      Icons.arrow_drop_up,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  getColor(month, int selectedMonthIndex, List months) {
    int monthIndex = months.indexOf(month);

    if (monthIndex == selectedMonthIndex) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }
}
