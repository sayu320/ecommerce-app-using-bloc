import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/data/cart_items.dart';
import 'package:flutter_bloc_tutorial/data/grocery_data.dart';
import 'package:flutter_bloc_tutorial/data/wishlist_item.dart';
import 'package:flutter_bloc_tutorial/features/home/models/product_data_models.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {

      //each event
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(
      homeProductCartButtonClickedEvent);

    on<HomeWishlistButtonNavigateEvent>(
      homeWishlistButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(
      homeCartButtonNavigateEvent);
  }
     //methods of each events (this method takes 2 parameters an event and emitter state to update the ui)
     
    FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
     emit(HomeLoadingState()); 
     await Future.delayed(Duration(seconds: 3));
     emit(HomeLoadedSuccessState(products: GroceryData.fruitProducts.map((e) => ProductDataModel(
      id: e['id'], 
      name: e['name'], 
      decsription: e['description'], 
      price: e['price'], 
      imageUrl: e['imageUrl']
      )
      ).toList()
      )
      );
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Wishlist Product Clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart Product Clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());

  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
        print('Wishlist Navigate Clicked');
        emit(HomeNavigateToWishlistPageActionState());
      }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
        print('Cart Navigate Clicked');
        emit(HomeNavigateToCartPageActionState());
      }


}
