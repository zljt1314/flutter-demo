import 'package:flutter/material.dart';
import 'package:yl_flutter_notes_test/modules/home/models/category.dart';
import 'package:yl_flutter_notes_test/modules/utils/color_utils.dart';
import 'package:yl_flutter_notes_test/modules/utils/yl_utils.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 解决刘海，不规则屏幕的显示问题
      body: SafeArea(
          child: Column(
        children: [
          const _TitleBarWidget(),
          Expanded(child: buildListView()),
        ],
      )),
    );
  }

  ListView buildListView() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        Container(
          child: ExpansionPanelList(
            expansionCallback: (index, isExpanded) {
              setState(() {
                itemList[index].isExpanded = !isExpanded;
              });
            },
            children: itemList
                .map<ExpansionPanel>((Item item) => ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return ListTile(
                        title: Text(item.title),
                      );
                    },
                    body: ListView.builder(
                        // 高度适配
                        shrinkWrap: true,
                        // 滑动嵌套适配
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: item.categoryModelList.length,
                        itemBuilder: (context, position) {
                          CategoryModel categoryModel =
                              item.categoryModelList[position];
                          return _CategoryItem(category: categoryModel);
                        }),
                    isExpanded: item.isExpanded))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatefulWidget {
  final CategoryModel category;

  const _CategoryItem({Key key, this.category}) : super(key: key);

  @override
  _CategoryItemState createState() => new _CategoryItemState();
}

class _CategoryItemState extends State<_CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        shape: ContinuousRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.black12,
        child: InkWell(
          onTap: () {
            YlUtils.toast(widget.category.title);
          },
          child: Container(
            height: 65,
            child: Row(
              children: [
                Expanded(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          widget.category.icon,
                          width: 35,
                          height: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          widget.category.title,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.black54,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(_CategoryItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

class _TitleWidget extends StatelessWidget {
  final String title;
  final String icon;

  const _TitleWidget({
    Key key,
    this.title,
    this.icon,
  })  : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            color: Colors.red,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _TitleBarWidget extends StatelessWidget {
  const _TitleBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitleBar(title: 'Demo');
  }
}

class TitleBar extends StatelessWidget {
  final String title;

  const TitleBar({
    Key key,
    this.title,
  }) : super(key: key);

  List<TextSpan> getListSpan() {
    return List.generate(
        title.length,
        (index) => TextSpan(
              text: title[index],
              style: TextStyle(color: ColorUtils.getRandomColor()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w600, letterSpacing: 0.5),
            children: getListSpan(),
          ),
        ),
      ),
    );
  }
}
