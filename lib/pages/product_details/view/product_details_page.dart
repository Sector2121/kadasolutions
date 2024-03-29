import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kadasolutions/index.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 200,
            child: Image.network(
              product.thumbnail,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Description',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            product.description,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Images',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: product.images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final image = product.images[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 200,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
