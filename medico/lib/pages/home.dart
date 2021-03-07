import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/widgets.dart/appDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Constants.boldAppbarHeading,
        ),
      ),
      drawer: AppDrawer(),
      body: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 9 / 10,
        children: [
          for (int i = 0; i < 10; i++)
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    margin: EdgeInsets.only(top: 120),
                    child: ListTile(
                      title: Text('Doctor Name'),
                      subtitle: Text(
                        'Doctor Category',
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
