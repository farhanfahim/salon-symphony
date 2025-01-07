class ListweekdayItemModel {

  String timeIn="7:00 AM",timeOut="3:00 PM";
  ListweekdayItemModel();

  @override
  String toString() {
    return "${timeIn} - ${timeOut}";
  }

}
