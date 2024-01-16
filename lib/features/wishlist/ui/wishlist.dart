import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_tutorial/features/wishlist/ui/wishlist_tile_widget.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final WishlistBloc wishlistBloc = WishlistBloc();
 
@override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist Items'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is !WishlistActionState,
        builder: (context, state) {
     
        switch (state.runtimeType) {
          case WishlistSuccessState:
            final successState = state as WishlistSuccessState;
            return ListView.builder(
            itemCount: successState.wishlistItems.length,
            itemBuilder:(context, index) {
            return WishlistTileWidget(
              wishlistBloc:wishlistBloc ,
              productDataModel: successState.wishlistItems[index]);
          },);
          default:
        }

          return Container();
        },
      ),
    );
  }
}
