import 'package:bloc/bloc.dart';
import 'package:la_vie/model/cart/cart_model.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

import '../app/functions.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  int totalPrice = 0;

  late Database database;
  List<CartModel> cart = [];

  //todo: Apply SQLite in cart
  Future<void> addToCart(CartModel model) async {
    bool isItemAdded = false;

    for (int i = 0; i < cart.length; i++) {
      if (model.productId == cart[i].productId) {
        updateProductCountFromDatabase(
            model.productId, cart[i].count + model.count);
        show('Old Record Updated');
        isItemAdded = true;
      }
    }
    if (isItemAdded == false || cart.isEmpty) {
      insertIntoDatabase(cartModel: model);
      isItemAdded = true;
    }
    emit(CartItemAdded());
  }

  Future<void> deleteItem(CartModel model) async {
    for (int i = 0; i < cart.length; i++) {
      if (model.productId == cart[i].productId) {
        cart.remove(model);
        getTotalPrice();
        emit(CartItemRemoved());
      }
    }
  }

  void getTotalPrice() {
    totalPrice = 0;

    cart.forEach((element) {
      totalPrice += element.price * element.count;
    });
  }

  void changeCount(String id, int count) {
    for (int i = 0; i <= cart.length; i++) {
      if (id == cart[i].productId) {
        cart[i].count = count;
        break;
      }
    }
    getTotalPrice();
    emit(CartCountChanged());
  }

  void createDatabase() {
    openDatabase(
      'database.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
                'CREATE TABLE cart (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, productId TEXT, name TEXT, imageUrl TEXT, count INTEGER, price INTEGER)')
            .then((value) {})
            .catchError((error) {
          show("Error while creating table ${error.toString()}");
        });
      },
      onOpen: (database) {
        getDataFormDatabase(database);
        show('database opened');
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

  void getDataFormDatabase(database) async {
    cart = [];
    database.rawQuery('SELECT * FROM cart').then((value) {
      value.forEach((element) {
        cart.add(CartModel(
            productId: element['productId'],
            name: element['name'],
            image: element['imageUrl'],
            price: element['price'],
            count: element['count']));
      });
      getTotalPrice();
    });
    emit(GetDataFromDatabase());
  }

  void updateProductCountFromDatabase(String id, int count) {
    database.rawUpdate('UPDATE cart SET count = ? WHERE productId = ?',
        ['$count', id]).then((value) {
      getDataFormDatabase(database);
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
      show("Delete Completed");
    });
  }
}
