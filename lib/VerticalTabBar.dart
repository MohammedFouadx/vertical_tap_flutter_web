import 'package:flutter/material.dart';

class VerticalTab extends StatefulWidget {
   int drawerIndex;

   VerticalTab({
    required this.drawerIndex,
    super.key
  });
  @override
  _VerticalTabState createState() => _VerticalTabState();
}

class _VerticalTabState extends State<VerticalTab> {
  int selectedIndex = 0;

  List<Map<String, dynamic>> itemTab = [
    {"name": "الصفحة الرئيسية"},
    {"name": "تغيير الاعدادات الشخصية"},
    {"name": "مفضلاتي"},
    {"name": "عناويني"}
  ];
  late PageController _pageController ;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.drawerIndex);
    setState(() {
      selectedIndex = widget.drawerIndex;
    });

    // if (_pageController.hasClients) {
    //   _pageController.jumpTo(selectedIndex.toDouble());
    // }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 150,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 5);
              },
              itemCount: itemTab.length,
              itemBuilder: (BuildContext context, int index) {

                return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        widget.drawerIndex = index;
                        _pageController.jumpToPage(index);

                      });
                    },
                    child: Container(
                      child: Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            height: (selectedIndex == index) ? 40 : 0,
                            color: Colors.blue,
                          ),
                          Expanded(
                              child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  alignment: Alignment.center,
                                  height: 50,
                                  color: (selectedIndex == index)
                                      ? Colors.blueGrey.withOpacity(0.5)
                                      : Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
                                    child: Text(itemTab[index]['name']),
                                  )))
                        ],
                      ),
                    ));
              },
            ),
          ),
          Expanded(
              child: Container(
            child: PageView(
              controller: _pageController,
              children: [
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text("Ali"),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text("Mohammed"),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text("Ali"),
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Text("yahya"),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
