import 'package:flutter/material.dart';

import 'VerticalTabBar.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<Map<String, dynamic>> drawerItem = [
    {"name": "الصفحة الرئيسية", "icon": Icons.home},
    {"name": "تغيير الاعدادات الشخصية" , "icon": Icons.settings},
    {"name": "مفضلاتي" ,"icon": Icons.settings},
    {"name": "عناويني" ,"icon": Icons.settings}
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int drawerindex) {
              return SizedBox(height: 5);
            },
            itemCount: drawerItem.length,
            itemBuilder: (BuildContext context, int drawerindex) {
              return Container(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerticalTab(
                                  drawerIndex: drawerindex,
                                )));
                      },
                      child: ListTile(
                        title: Text(
                         drawerItem[drawerindex]['name'],
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        leading: Icon(
                          drawerItem[drawerindex]['icon'],
                          color: Colors.red,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.0,
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.grey[500],
                    ),
                  ],
                ),
              );
            }));
  }
}
