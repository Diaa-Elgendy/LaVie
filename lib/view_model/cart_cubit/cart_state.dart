part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartItemAdded extends CartState {}
class CartItemRemoved extends CartState {}
class CartCountChanged extends CartState {}
class GetDataFromDatabase extends CartState {}
