import 'package:flutter/material.dart';

import '../../values/colors.dart';

class PrimaryTabButton extends StatelessWidget {
  final String buttonText;
  final int itemIndex;
  final ValueNotifier<int> notifier;
  final VoidCallback? callback;
  final IconData buttonIcon;

  const PrimaryTabButton(
      {Key? key,
      this.callback,
      required this.notifier,
      required this.buttonText,
      required this.itemIndex,
      required this.buttonIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      // width: 110,
      width: 150,
      height: 50,
      child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (BuildContext context, _, __) {
            return notifier.value == itemIndex
                ? ElevatedButton(
                    onPressed: () {
                      notifier.value = itemIndex;

                      if (callback != null) {
                        callback!();
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: notifier.value == itemIndex
                            ? MaterialStateProperty.all<Color>(Colors.grey.shade50)
                            : MaterialStateProperty.all<Color>(Colors.white),
                        shape: notifier.value == itemIndex
                            ? MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ))
                            : MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          buttonIcon,
                          color: notifier.value == itemIndex
                              ? Colors.black
                              : Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Text(buttonText,
                            style: TextStyle(
                              fontSize: 16,
                              color: notifier.value == itemIndex
                                  ? Colors.black
                                  : Colors.white,
                            )),
                      ],
                    ))
                : InkWell(
                    onTap: () {
                      notifier.value = itemIndex;

                      if (callback != null) {
                        callback!();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: 150,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            buttonIcon,
                            color: notifier.value == itemIndex
                                ? Colors.black
                                : Colors.grey,
                          ),
                          const SizedBox(width: 10),
                          Text(buttonText,
                              style: TextStyle(
                                fontSize: 16,
                                color: notifier.value == itemIndex
                                    ? Colors.black
                                    : Colors.white,
                              )),
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}
