import 'package:demo/flutterinaction/basics.dart';

class FunctionWidgetsEntryPage extends BaseSubEntryPage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => "/function_widgets";

  @override
  String get title => "功能型Widgets";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FunctionWidgetsEntryPage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  // TODO: implement url
  String get url => null;
}
