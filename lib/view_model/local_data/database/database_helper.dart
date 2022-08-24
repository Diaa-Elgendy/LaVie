import 'package:la_vie/model/cart/cart_model.dart';
import 'package:la_vie/view_model/app/functions.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database database;

  void createDatabase() async {
    openDatabase(
      'database.db',
      version: 1,
      onCreate: (database, version) {
        show('Database created');
        database
            .execute(
                'CREATE TABLE cart (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, productId TEXT, name TEXT, imageUrl TEXT, count INTEGER, price INTEGER)')
            .then((value) {
          show('Table cart created Successfully');
        }).catchError((error) {
          show("Error while creating table ${error.toString()}");
        });
      },
      onOpen: (database) {
        getDataFormDatabase(database);
      },
    ).then((value) {
      database = value;
    });
  }

  Future insertIntoDatabase({required CartModel cartModel}) async {
    return await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO cart (productId, name, imageUrl, count, price) VALUES ("${cartModel.productId}", "${cartModel.name}", "${cartModel.image}", "${cartModel.count}", "${cartModel.price}")')
          .then((value) {
        show("$value inserted successfully");
        getDataFormDatabase(database);
      }).catchError((error) {
        show("Error while inserting record ${error.toString()}");
      });
      return null;
    });
  }

  Future<List<CartModel>> getDataFormDatabase(database) async {
    List<CartModel> cartList = [];
    await database.rawQuery('SELECT * FROM cart').then((value) {
      value.forEach((element) {
        cartList.add(CartModel(
            productId: element['productId'],
            name: element['name'],
            image: element['imageUrl'],
            price: element['price'],
            count: element['count']));
      });
    });
    return cartList;
  }

  void updateProductCountFromDatabase(String id, int count) {
    database.rawUpdate('UPDATE cart SET count = ? WHERE productId = ?',
        ['$count', id]).then((value) {
      getDataFormDatabase(database);
      show("Update Completed");
    });
  }

  void deleteFromDatabase(int id) {
    database
        .rawDelete('DELETE FROM cart WHERE productId = ?', [id]).then((value) {
      getDataFormDatabase(database);
      show("Delete Completed");
    });
  }

  void clearDatabase() {
    database.rawDelete('DELETE FROM cart').then((value) {
      getDataFormDatabase(database);
      print('database Cleared');
      show("Delete Completed");
    });
  }

  DatabaseHelper();
}
