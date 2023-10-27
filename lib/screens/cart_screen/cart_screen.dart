import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/constant/app_colors.dart';
import 'package:miniproject/constant/app_images.dart';
import 'package:miniproject/constant/app_list.dart';

class CartScreen extends StatefulWidget {
  final List item;
  const CartScreen({super.key, required this.item});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    print('cart_LIST ${widget.item}');

    void increaseQuantity(id) {
      print('id $id');
      bool itemExists = false;

      for (int i = 0; i < widget.item.length; i++) {
        if (widget.item[i]['item_id'] == id) {
          setState(() {
            widget.item[i]['item_qty'] += 1;
          });
          print('Item quantity increased.');
          itemExists = true;
          break; // Exit the loop since the item was found.
        }
      }

      if (!itemExists) {
        print('No Item Exists.');
      }
    }

    void decreaseQuantity(id) {
      bool itemExists = false;

      for (int i = 0; i < widget.item.length; i++) {
        if (widget.item[i]['item_id'] == id) {
          setState(() {
            if (widget.item[i]['item_qty'] == 1) {
              Applist.cartItem.removeWhere((item) => item['item_id'] == id);
            } else {
              widget.item[i]['item_qty'] -= 1;
            }
          });
          print('Item quantity Decreased.');
          itemExists = true;
          break; // Exit the loop since the item was found.
        }
      }

      if (!itemExists) {
        print('No Item Exists.');
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                color: Appcolors.darkOrange,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Column(children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              AppImages.backIcon,
                              height: 12,
                              width: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text('Shopping Cart ${widget.item.length}')
                      ],
                    ),
                    Stack(children: [
                      Positioned(
                        top: 0,
                        right: 10,
                        child: Text(
                          'OFF!',
                          style: TextStyle(color: Appcolors.black_10),
                        ),
                      ),
                      Text(
                        '35%',
                        style: TextStyle(
                            fontSize: 110,
                            fontWeight: FontWeight.w800,
                            color: Appcolors.black_10),
                      ),
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Use code #HalalFood at Checkouut',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.black_90),
                    )
                  ]),
                ),
              ),
              Positioned(
                  top: 15,
                  right: 15,
                  child: SvgPicture.asset(
                    AppImages.thunderIcon,
                    height: 40,
                    width: 40,
                    color: Colors.black,
                  )),
            ]),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10.0),
                    height: 110,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1.0, color: Appcolors.black_20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          widget.item[index]['item_image'][0],
                          height: 80,
                          width: 80,
                          fit: BoxFit.contain,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.item[index]['item_name'].toString()),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  '\$ ${widget.item[index]['item_price'].toString()}'),
                            ]),
                        InkWell(
                          onTap: () {
                            decreaseQuantity(widget.item[index]['item_id']);
                          },
                          child: CircleAvatar(
                            backgroundColor: Appcolors.black_10,
                            child: SvgPicture.asset(
                              AppImages.minusIcon,
                              height: 15,
                              width: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(widget.item[index]['item_qty'].toString()),
                        InkWell(
                          onTap: () {
                            increaseQuantity(widget.item[index]['item_id']);
                          },
                          child: CircleAvatar(
                            backgroundColor: Appcolors.black_10,
                            child: SvgPicture.asset(
                              AppImages.plusIcon,
                              height: 15,
                              width: 15,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: widget.item.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolors.black_10,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Sub total',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  height: 2,
                                  color: Appcolors.black_45),
                            ),
                            Text(
                              '\$354',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  height: 2,
                                  color: Appcolors.black_90),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Delivery',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  height: 2,
                                  color: Appcolors.black_45),
                            ),
                            Text(
                              '\$354',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  height: 2,
                                  color: Appcolors.black_90),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  height: 2,
                                  color: Appcolors.black_45),
                            ),
                            Text(
                              '\$354',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  height: 2,
                                  color: Appcolors.black_90),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: FractionallySizedBox(
                            widthFactor: 0.8,
                            heightFactor: 0.7,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Appcolors.darkBlue,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text('Procced to checkout'))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
