enum CategoryType {
  beginner_ios,
  beginner_android,
  basics_widget,
  basics_layout,
  basics_func,
  basics_http,
  basics_json,
  advance_state,
  advance_async,
  advance_mixing,
  advance_pin,
  advance_tips,
  project_struct,
  project_login,
  project_business
}

class CategoryModel {
  String title;
  String icon;
  CategoryType type;

  CategoryModel(this.title, this.icon, this.type);
}

List<CategoryModel> beginnerCategories = [
  CategoryModel('iOS初学者', 'assets/images/home/category_ios.png',
      CategoryType.beginner_ios),
  CategoryModel('Android初学者', 'assets/images/home/category_android.png',
      CategoryType.beginner_android),
];

List<CategoryModel> basicsCategories = [
  CategoryModel('基础组件', 'assets/images/home/category_widget.png',
      CategoryType.basics_widget),
  CategoryModel('布局组件', 'assets/images/home/category_layout.png',
      CategoryType.basics_layout),
  CategoryModel(
      '功能组件', 'assets/images/home/category_func.png', CategoryType.basics_func),
  CategoryModel(
      'Http', 'assets/images/home/category_http.png', CategoryType.basics_http),
  CategoryModel('Json解析', 'assets/images/home/category_json.png',
      CategoryType.basics_json),
];

List<CategoryModel> advancedCategories = [
  CategoryModel('状态管理', 'assets/images/home/category_state.png',
      CategoryType.advance_state),
  CategoryModel('异步使用', 'assets/images/home/category_sync.png',
      CategoryType.advance_async),
  CategoryModel('混合开发', 'assets/images/home/category_mixing.png',
      CategoryType.advance_mixing),
  CategoryModel(
      '跨平台通信', 'assets/images/home/category_pin.png', CategoryType.advance_pin),
  CategoryModel('Tips', 'assets/images/home/category_tips.png',
      CategoryType.advance_tips),
];

List<CategoryModel> projectCategories = [
  CategoryModel('代码构架', 'assets/images/home/category_struct.png',
      CategoryType.project_struct),
  CategoryModel('简单登录', 'assets/images/home/category_login.png',
      CategoryType.project_login),
  CategoryModel('业务开发', 'assets/images/home/category_business.png',
      CategoryType.project_business),
];

class Item {
  String title;
  List<CategoryModel> categoryModelList;
  bool isExpanded;

  Item(this.title, this.categoryModelList, this.isExpanded);
}

List<Item> itemList = [
  Item('入门', beginnerCategories, true),
  Item('基础', basicsCategories, false),
  Item('进阶', advancedCategories, false),
  Item('实战', projectCategories, false),
];