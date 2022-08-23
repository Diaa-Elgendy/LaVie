import 'dart:ffi';

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
    bool found = true;

    insertIntoDatabase(cartModel: model).then((value) => GetDataFromDatabase());

    // if (cart.isEmpty) {
    //   insertIntoDatabase(cartModel: model);
    //   print('first');
    // } else {
    //   for (int i = 0; i < cart.length; i++) {
    //     if (model.productId == cart[i].productId){
    //       updateProductCountFromDatabase(model.productId, model.count);
    //       break;
    //     }
    //   }
    //   if (found == true) {
    //     cart.add(model);
    //     found = false;
    //   }
    // }
    getTotalPrice();
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

  Future<void> getTotalPrice() async {
    totalPrice = 0;

    for (int i = 0; i < cart.length; i++) {
      totalPrice += cart[i].price * cart[i].count;
    }
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
        print(value);
    });
    emit(GetDataFromDatabase());
    print('Cart Length: ${cart.length}');
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
}
