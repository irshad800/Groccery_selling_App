import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Cartmodels.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Cart>> getCart() {
    return _firestore.collection('cart').snapshots().map((snapshot) {
      return snapshot.docs
          .map(
              (doc) => Cart.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    });
  }

  Future<void> addCart(Cart cart) async {
    await _firestore.collection('cart').add(cart.toMap());
  }

  Future<void> deleteCart(String id) async {
    await _firestore.collection('cart').doc(id).delete();
  }
}
