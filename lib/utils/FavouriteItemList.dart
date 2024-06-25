List<dynamic> fitems = [];
void fav(
    {String? favName,
    String? favImage,
    String? favPrice,
    int? qty,
    Function? onTapAdd,
    int? index}) {
  Map<String, dynamic> favitems = {
    "name": favName,
    "image": favImage,
    "price": favPrice,
    "qty": qty,
    "onTapAdd": onTapAdd,
    "index": index
  };
  print(favitems);
  fitems.add(favitems);
  print(fitems);
}

void delete({required int index}) {
  fitems.removeAt(index);
}
