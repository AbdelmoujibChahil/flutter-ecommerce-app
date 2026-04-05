import 'package:flutter/material.dart';
import 'package:project/app/controllers/main/productController/CartController.dart';

class CartItem extends StatelessWidget {
   const CartItem({Key? key, required this.index, required this.onPressedAdd,required this.onPressedRemove, required this.cartController}) : super(key: key);

  final int index;
  final VoidCallback? onPressedAdd;
    final VoidCallback? onPressedRemove;

  final CartController cartController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          // IMAGE
          Container(
            width: 130,
            height: double.infinity,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(cartController.cartItems[index]["image"]?[0] ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // DETAILS

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                      cartController.cartItems[index]["name"] ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
              "\$${cartController.cartItems[index]["price"]}",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                  GestureDetector(
                    onTap: onPressedRemove,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: const Icon(Icons.remove, size: 14),
                    ),
                  ), 
                 Text(
                  "${cartController.cartItems[index]["quantity"]}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                    onTap: onPressedAdd,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: const Icon(Icons.add, size: 14),
                    ),
                  ), 
                    const Spacer(),
                     IconButton(onPressed: (){
                      cartController.removeItem(index);
                     }, icon: Icon(Icons.close))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
