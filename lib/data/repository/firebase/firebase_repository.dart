import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepository<T> {
  final String collectionName;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseRepository(this.collectionName);

  /// Ekleme işlemi yaparken [T]'nin yapısının [Map<String, dynamic>] yapıda olması için
  /// [.toMap] fonkiyou ile gonder veya direkt o yapıda ver
  Future<void> addItem(T item) async {
    await _firestore
        .collection(collectionName)
        .add(item as Map<String, dynamic>);
  }

  ///firebase collections'u [Map<String, dynamic>] olarak return ediyor
  Future<List<T>> getItems() async {
    final snapshot = await _firestore.collection(collectionName).get();
    return snapshot.docs.map((doc) => doc.data() as T).toList();
  }

  ///firebase doc'u [Map<String, dynamic>] olarak return ediyor
  Future<T> getItemById(String id) async {
    final doc = await _firestore.collection(collectionName).doc(id).get();
    return doc.data() as T;
  }

  ///[T], [Map<String, dynamic>] turunde olmak zorunda
  ///[id], firebase colelctionId
  Future<void> updateItem(String id, T newItem) async {
    await _firestore
        .collection(collectionName)
        .doc(id)
        .update(newItem as Map<String, dynamic>);
  }

  ///[fieldName] documentin içierisindeki fieldin İsmi,
  ///[newValue] o fieldin yeni değeri
  ///[id] documentin id'si
  Future<void> updateField(
      String id, String fieldName, dynamic newValue) async {
    Map<String, dynamic> updateData = {fieldName: newValue};
    await _firestore.collection(collectionName).doc(id).update(updateData);
  }

  ///verilen doc [id]'ye gore silme işlemi yapar
  Future<void> deleteItem(String id) async {
    await _firestore.collection(collectionName).doc(id).delete();
  }
}
