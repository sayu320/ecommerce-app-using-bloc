import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/features/home/models/product_data_models.dart';
import 'package:flutter_bloc_tutorial/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget({
    super.key, 
    required this.productDataModel, 
    required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.lightGreen)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          const SizedBox(height: 10,),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            productDataModel.decsription,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productDataModel.price}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                    IconButton(
                  onPressed: () {
                  wishlistBloc.add(RemoveFromWishlisEvent(
                    productDataModel: productDataModel
                  ));
                  },
                  icon: const Icon(Icons.favorite)),
              IconButton(
                 onPressed: () {
                 // cartBloc.add(CartRemoveFromCartEvent(productDataModel: productDataModel));
                 },
                  icon: const Icon(Icons.shopping_bag_outlined))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
