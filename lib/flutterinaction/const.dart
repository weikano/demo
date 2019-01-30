const TAG_TITLE = "title";

const ROUTE_BASIC_WIDGETS = "/basic_widgets";
const ROUTE_CONTAINER_WIDGETS = "/container_widgets";
const ROUTE_CUSTOM_WIDGETS = "/custom_widgets";
const ROUTE_ANIMATION = "/animations";
const ROUTE_EVENT_NOTIFICATION = "/event_notification";
const ROUTE_FILE_NETWORK = "/file_network";
const ROUTE_FUNCTION_WIDGETS = "/function_widgets";
const ROUTE_LAYOUT_WIDGETS = "/layout_widgets";
const ROUTE_SCROLL_WIDGETS = "/scroll_widgets";

const _divider = "/";

String basicWidgetsSub(String route) {
  return ROUTE_BASIC_WIDGETS+_divider+route;
}
String containerWidgetsSub(String route) {
  return ROUTE_CONTAINER_WIDGETS+_divider+route;
}
String customWidgetsSub(String route) {
  return ROUTE_CUSTOM_WIDGETS+_divider+route;
}
String animationSub(String route) {
  return ROUTE_ANIMATION+_divider+route;
}
String eventNotificationSub(String route) {
  return ROUTE_EVENT_NOTIFICATION+_divider+route;
}
String fileNetworkSub(String route) {
  return ROUTE_FILE_NETWORK+_divider+route;
}
String functionWidgetsSub(String route) {
  return ROUTE_FUNCTION_WIDGETS+_divider+route;
}
String layoutWidgetsSub(String route) {
  return ROUTE_LAYOUT_WIDGETS+_divider+route;
}
String scrollWidgetsSub(String route)=>ROUTE_SCROLL_WIDGETS+_divider+route;
