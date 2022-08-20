import 'package:bloc/bloc.dart';
import 'package:la_vie/model/cart/cart_Model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartModel> cartList = [];
  int totalPrice = 0;


  //todo: Apply SQLite in cart

  Future<void> addToCart(CartModel model) async {
    bool found = true;

    if (cartList.isEmpty) {
      cartList.add(model);
    } else {
      for (int i = 0; i < cartList.length; i++) {
        if (model.id == cartList[i].id) {
          cartList[i].count++;
          found = false;
          break;
        }
      }
      if (found == true) {
        cartList.add(model);
        found = false;
      }
    }
    getTotalPrice();
    emit(CartItemAdded());
  }

  Future<void> clearCart() async {
    cartList.clear();
  }

  Future<void> deleteItem(CartModel model) async {
    for (int i = 0; i < cartList.length; i++) {
      if (model.id == cartList[i].id) {
        cartList.remove(model);
        getTotalPrice();
        emit(CartItemRemoved());
      }
    }
  }

  Future<void> getTotalPrice() async {
    totalPrice = 0;

    for (int i = 0; i < cartList.length; i++) {
      totalPrice += cartList[i].price * cartList[i].count;
    }
  }

  void changeCount(String id, int count){
    for (int i = 0; i <= cartList.length; i++) {
      if(id == cartList[i].id){
        cartList[i].count = count;
        break;
      }
    }
    getTotalPrice();
    emit(CartCountChanged());
  }
}
