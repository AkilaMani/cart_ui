import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';
import '../values/constant.dart';
import 'home.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }

  Widget get body => Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            height: 80,
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    child: const Icon(Icons.arrow_back)),
                const Expanded(
                    child: Center(
                        child: Text(
                  'Your Cart',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )))
              ],
            ),
          ),
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            shrinkWrap: true,
            itemCount: cartImages.length,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) {
              return Divider(
                height: 2,
              );
            },
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(cartImages[index]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(brandNameCart[index]),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Text(dress[index]),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Size: ${dressSize[index]}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const Text('Color',
                                style: TextStyle(color: Colors.grey)),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.square_rounded,
                              size: 15,
                              // color: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '\$ 69.00',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .decrement();
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 15.0,
                                color: Colors.black,
                              ),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(2.0),
                                minimumSize: const Size(10.0, 10.0),
                                // color: Colors.lightGreenAccent),
                              ),
                            ),
                            // Text(qty[index]),
                            //using Provider
                            // Text(Provider.of<CartProvider>(context)
                            //     .itemCount
                            //     .toString()),
                            //Using Consumer
                            Consumer<CartProvider>(
                                builder: (context, itemCount, child) {
                              return Text('${itemCount.itemCount}');
                            }),
                            OutlinedButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .increment();
                              },
                              child: const Icon(
                                Icons.add,
                                size: 15.0,
                                color: Colors.black,
                              ),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.all(2.0),
                                minimumSize: const Size(10.0, 10.0),
                                // color: Colors.lightGreenAccent),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Total Price ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$215',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 1.0,
                ),
                Container(
                    margin: const EdgeInsets.all(10.0),
                    // padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Payment',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          )
        ],
      );
}
