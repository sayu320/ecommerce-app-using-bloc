part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent{}

class RemoveFromWishlisEvent extends WishlistEvent{
  final ProductDataModel productDataModel;

  RemoveFromWishlisEvent({
    required this.productDataModel
    });
}
