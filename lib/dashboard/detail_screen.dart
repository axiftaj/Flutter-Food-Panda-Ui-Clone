import 'package:flutter/material.dart';
import 'package:instagram_clone/constats/color.dart';
import 'package:scrollable_list_tabview/model/scrollable_list_tab.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class DetailScreen extends StatefulWidget {
  final String name, image;
  const DetailScreen({Key? key ,  required this.name , required this.image,}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: false,
                //backgroundColor: MyColors.primaryColor,
                floating: false,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  stretchModes: [
                    StretchMode.blurBackground
                  ],
                  // title:  Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Text(
                  //     widget.name,
                  //     style: TextStyle(fontSize: 25.0 , color: MyColors.primaryColor),
                  //     textAlign: TextAlign.left,
                  //   ),
                  // ),
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        width: double.infinity,
                        color: Colors.grey,
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.image)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.name,
                          style: TextStyle(fontSize: 25.0),
                          textAlign: TextAlign.left,
                        ),
                      ),

                    ],
                  ),
                ),
                expandedHeight: 250.0,

              ),
            ];
          },
          body: ScrollableListTabView(
            tabHeight: 48,
            bodyAnimationDuration: const Duration(milliseconds: 150),
            tabAnimationCurve: Curves.easeOut,
            tabAnimationDuration: const Duration(milliseconds: 200),
            tabs: [
              ScrollableListTab(
                tab: ListTab(
                  label: Text('Label 1'),
                  showIconOnList: true,
                ),
                body: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,

                      alignment: Alignment.center,
                      child: Text(index.toString()),
                    ),
                    title: Text('List element $index'),
                  ),
                ),
              ),
              ScrollableListTab(
                tab: ListTab(label: Text('Label 2'), icon: Icon(Icons.subject)),
                body: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => Card(
                    child: Center(child: Text('Card element $index')),
                  ),
                ),
              ),
              ScrollableListTab(
                tab: ListTab(
                    label: Text('Label 3'),
                    icon: Icon(Icons.subject),
                    showIconOnList: true),
                body: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => Card(
                    child: Center(child: Text('Card element $index')),
                  ),
                ),
              ),
              ScrollableListTab(
                tab: ListTab(label: Text('Label 4'), icon: Icon(Icons.add)),
                body: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                      alignment: Alignment.center,
                      child: Text(index.toString()),
                    ),
                    title: Text('List element $index'),
                  ),
                ),
              ),
              ScrollableListTab(
                tab: ListTab(label: Text('Label 5'), icon: Icon(Icons.group)),
                body: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      alignment: Alignment.center,
                      child: Text(index.toString()),
                    ),
                    title: Text('List element $index'),
                  ),
                ),
              ),
              ScrollableListTab(
                tab: ListTab(label: Text('Label 6'), icon: Icon(Icons.subject)),
                body: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => Card(
                    child: Center(child: Text('Card element $index')),
                  ),
                ),
              ),
              ScrollableListTab(
                tab: ListTab(
                  label: Text('Label 7'),
                  icon: Icon(Icons.subject),
                  showIconOnList: true,
                ),
                body: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => Card(
                    child: Center(child: Text('Card element $index')),
                  ),
                ),
              ),
              ScrollableListTab(
                tab: ListTab(label: Text('Label 8'), icon: Icon(Icons.add)),
                body: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (_, index) => ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                      alignment: Alignment.center,
                      child: Text(index.toString()),
                    ),
                    title: Text('List element $index'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
