import 'package:auto_size_text/auto_size_text.dart';
import 'package:final_project/models/home_models/product.dart';
import 'package:flutter/material.dart';


class ProductItem extends StatelessWidget {
  Product? product;
  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(product!.image
                                .toString()),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green.shade50
                            .withOpacity(0.6)),
                    child: Icon(product!.inFavorites!
                        ? Icons.favorite
                        : Icons.favorite_border_outlined),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      product!.name
                          .toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      maxFontSize: 18,
                      minFontSize: 14,
                    ),
                    AutoSizeText(
                      "${product!.price.toString()}EGP",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      maxFontSize: 12,
                      minFontSize: 10,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
