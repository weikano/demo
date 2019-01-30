import 'package:demo/flutterinaction/basics.dart';

class AnimationEntryPage extends BaseSubEntryPage {
  @override
  String get iconUrl => null;

  @override
  String get routeName => "/animation";

  @override
  String get title => "动画";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimationEntryPage && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;

  @override
  // TODO: implement url
  String get url => null;
}
