import 'package:flutter/material.dart';
import 'package:yl_flutter_notes_test/modules/home/models/category.dart';
import 'package:yl_flutter_notes_test/modules/utils/color_utils.dart';
import 'package:yl_flutter_notes_test/modules/utils/yl_utils.dart';
import 'package:yl_flutter_notes_test/routers.dart';

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
            _openCategoryPage(widget.category);
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
}

// 点击事件统一处理
void _openCategoryPage(CategoryModel category) {
  if (category == null) {
    return;
  }
  switch (category.type) {
    case CategoryType.beginner_ios:
      // TODO: Handle this case.
      RouterUtils.launchURL(
          'https://flutter.cn/docs/get-started/flutter-for/ios-devs');
      break;
    case CategoryType.beginner_android:
      // TODO: Handle this case.
      RouterUtils.launchURL(
          'https://flutter.cn/docs/get-started/flutter-for/android-devs');
      break;
    case CategoryType.basics_widget:
      // TODO: Handle this case.
      break;
    case CategoryType.basics_layout:
      // TODO: Handle this case.
      break;
    case CategoryType.basics_func:
      // TODO: Handle this case.
      break;
    case CategoryType.basics_http:
      // TODO: Handle this case.
      break;
    case CategoryType.basics_json:
      // TODO: Handle this case.
      break;
    case CategoryType.advance_state:
      // TODO: Handle this case.
      break;
    case CategoryType.advance_async:
      // TODO: Handle this case.
      break;
    case CategoryType.advance_mixing:
      // TODO: Handle this case.
      break;
    case CategoryType.advance_pin:
      // TODO: Handle this case.
      break;
    case CategoryType.advance_tips:
      // TODO: Handle this case.
      break;
    case CategoryType.project_struct:
      // TODO: Handle this case.
      break;
    case CategoryType.project_login:
      // TODO: Handle this case.
      break;
    case CategoryType.project_business:
      // TODO: Handle this case.
      break;
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
