import 'package:flutter/material.dart';
import 'package:money_manager_final/functions.dart';
import 'package:money_manager_final/providerr.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final TextEditingController amount = TextEditingController();
  final TextEditingController descripton = TextEditingController();
  late String type;
  late String method;
  int buttonIndex = 2;
  int buttonIndex1 = 3;
  final decor = BoxDecoration(
    color: Colors.blueGrey.shade400,
    border: const Border(
      top: BorderSide(width: 2),
      bottom: BorderSide(width: 2),
      left: BorderSide(width: 2),
      right: BorderSide(width: 2),
    ),
    borderRadius: BorderRadius.circular(10),
  );
  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(
        builder: (context, value, child) => Scaffold(
              body: SafeArea(
                child: Center(
                  child: AlertDialog(
                    backgroundColor: const Color.fromARGB(255, 209, 207, 207),
                    title: const Text('Add a Transaction',
                        style: TextStyle(fontSize: 35)),
                    content: Wrap(children: [
                      Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Amount \t:',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: TextField(
                                    controller: amount,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                            Icons.monetization_on_outlined),
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Description \t:',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    child: TextField(
                                      controller: descripton,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 30),
                            button(context),
                            const SizedBox(height: 10),
                            buttonCr(context),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final ad = context.read<Providerr>();
                                    if (buttonIndex == 0) {
                                      method = 'Credit';
                                    } else if (buttonIndex == 1) {
                                      method = 'Debit';
                                    }
                                    if (buttonIndex1 == 0) {
                                      type = 'Cash';
                                    } else if (buttonIndex1 == 1) {
                                      type = 'Card';
                                    } else if (buttonIndex1 == 2) {
                                      type = 'Other';
                                    }
                                    ad.add(
                                        '${DateTime.now().hour}:${DateTime.now().minute}',
                                        '${DateTime.now().day}/${DateTime.now().month}',
                                        amount.text.toString().trim(),
                                        method,
                                        type,
                                        descripton.text.toString().trim());

                                    setState(() {});
                                    Navigator.pop(context);
                                    setState(() {});
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (context) {
                                    //       return AlertDialog(
                                    //         title: Text('Transaction added succesfully',
                                    //         style: Theme.of(context).textTheme.labelSmall),
                                    //       );
                                    //     });
                                  },
                                  icon: Icon(Icons.check_circle, size: 40),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                      Icons.cancel_presentation_sharp,
                                      size: 40),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ));
  }

  Container button(BuildContext contextx) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: const Border(
          top: BorderSide(width: 2),
          bottom: BorderSide(width: 2),
          left: BorderSide(width: 2),
          right: BorderSide(width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: buttonIndex == 0 ? decor : null,
            child: TextButton.icon(
              onPressed: () {
                buttonIndex = 0;
                setState(() {});
              },
              label: Text('Credit',
                  style: Theme.of(context).textTheme.labelMedium),
            ),
          ),
          Container(
            decoration: buttonIndex == 1 ? decor : null,
            child: TextButton.icon(
              onPressed: () {
                buttonIndex = 1;
                setState(() {});
              },
              label:
                  Text('Debit', style: Theme.of(context).textTheme.labelMedium),
            ),
          ),
        ],
      ),
    );
  }

  Container buttonCr(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: const Border(
          top: BorderSide(width: 2),
          bottom: BorderSide(width: 2),
          left: BorderSide(width: 2),
          right: BorderSide(width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: buttonIndex1 == 0 ? decor : null,
            child: TextButton.icon(
              onPressed: () {
                buttonIndex1 = 0;
                setState(() {});
              },
              label:
                  Text('Cash', style: Theme.of(context).textTheme.labelMedium),
            ),
          ),
          Container(
            decoration: buttonIndex1 == 1 ? decor : null,
            child: TextButton.icon(
              onPressed: () {
                buttonIndex1 = 1;
                setState(() {});
              },
              label:
                  Text('Card', style: Theme.of(context).textTheme.labelMedium),
            ),
          ),
          Container(
            decoration: buttonIndex1 == 2 ? decor : null,
            child: TextButton.icon(
              onPressed: () {
                buttonIndex1 = 2;
                setState(() {});
              },
              label: Text('Others',
                  style: Theme.of(context).textTheme.labelMedium),
            ),
          ),
        ],
      ),
    );
  }
}
