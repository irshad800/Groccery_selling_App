List<dynamic> Chkitems = [];
void ChkOut(
    {String? favName, String? favImage, int? favPrice, int? qty, int? index}) {
  Map<String, dynamic> caritems = {
    "name": favName,
    "image": favImage,
    "price": favPrice,
    "qty": qty,
    "index": index
  };
  print(caritems);
  Chkitems.add(caritems);
  print(Chkitems);
}

void delete({required int index}) {
  Chkitems.removeAt(index);
}
