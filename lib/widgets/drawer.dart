import 'package:bmi_calculator/services/logics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<BmiState>(

      builder: (BuildContext context, BmiState bmi, Widget? child)=>Drawer(

        child: ListView(
          children: [
            DrawerHeader(
                child: Container(
                  color: Colors.blueGrey,
                )),
            ListTile(
              leading: const Text("Theme"),
              trailing: Switch.adaptive(
                  value: bmi.toggled,
                  onChanged: (value) => bmi.changeTheme()),
            )
          ],
        ),
      ),
    );
  }
}
