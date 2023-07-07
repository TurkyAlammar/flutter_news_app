import 'package:intl/intl.dart';

class HomeModel {
  String page_title = "HeadLine";
  String page_current_time =
      "Today, " + DateFormat("MMMM, dd").format(DateTime.now()) + "rd";
  String categorie_text = "Technology"; //will be change in future
  String tranding_news_title = "Tranding";
  String latest_news_title = "Latest";
}
