import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../values/constant.dart';
import '../widget/button/primary_tab_button.dart';
import '../widget/widget.dart';
import 'cart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ValueNotifier<int> _pagesEComButtonTrigger = ValueNotifier(0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: newArrival,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PrimaryTabButton(
              buttonText: pages[0],
              itemIndex: 0,
              notifier: _pagesEComButtonTrigger,
              callback: () {
                _onItemTapped(0);
              },
              buttonIcon: Icons.home,
            ),
            PrimaryTabButton(
              buttonText: pages[1],
              itemIndex: 1,
              notifier: _pagesEComButtonTrigger,
              callback: () {
                _onItemTapped(1);
              },
              buttonIcon: Icons.shopping_bag,
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
      if (_selectedIndex == 1) {
        // _selectedIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Cart()),
        );
      }
    });
  }

  Widget get newArrival => Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(Icons.menu), Icon(Icons.search)],
            ),
          ),
          Container(
            width: double.infinity,
            // color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: const Text(
              'New Arrivals',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          gridViewContent
        ],
      );

  Widget get gridViewContent => Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: newArrivalImages.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 5,
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Expanded(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 170,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(newArrivalImages[index]),
                          ),
                        ),
                        // child: Image.asset(newArrivalImages[index],
                        //     fit: BoxFit.fill)
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(names[index], style: smallTextStyle()),
                      ),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(brandName[index], style: simpleTextStyle()),
                      ),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$ ${amount[index]}'),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
}
