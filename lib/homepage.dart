import 'package:curved_bottom_navigation_bar/curved_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:money_manager_final/add_transaction.dart';
import 'package:money_manager_final/functions.dart';
import 'package:money_manager_final/graph_test.dart';
import 'package:money_manager_final/providerr.dart';
import 'package:money_manager_final/sms_tester.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'default_values.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final amtController = TextEditingController();
  final descController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();
  final methodController = TextEditingController();
  final typeController = TextEditingController();
  int selectedIndex = 0;
  List<Widget> pages = [
    NewWidget(),
    BarChartSample4(),
     Placeholder()       
  ];

  // SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    prefsGet();
    Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:SharedPreferences.getInstance(),
      builder: (context,future) =>
      future.data==null?
      CircularProgressIndicator()
      :Consumer<Providerr>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.green.shade50,
          appBar: AppBar(
            backgroundColor: Colors.green.shade50,
            title: Center(
              child: Text("MONEY MANAGER",style: TextStyle(fontWeight: FontWeight.bold),)),
            leading: Container(
                margin: EdgeInsets.all(5),
                child: Icon(
                  Icons.monetization_on,
                  size: 30,
                )),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddTransaction()));
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.green.shade50,
            buttonBackgroundColor: Colors.green.shade50,
            height: 50,
            items: [
              Container(
                padding: EdgeInsets.all(3),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, border: Border.all()),
                child: Icon(
                  Icons.abc_outlined,
                  size: 20,
                ),
              ),
              Icon(
                Icons.bolt,
                size: 20,
              ),
              
            ],
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
          ),
          body: FutureBuilder(
              future: prefsGet(),
              builder: (context, snapshot) {
                return pages[selectedIndex];
              }),
        ),
      ),
    );
  }

//exvucse me pardon me the wind it blows so hard on me like mother nature arguing prefsGet() context snapshot mainbody
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Providerr>(      
      builder:(context,value,child)=> SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Today\'s total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${calculate_daily()} \$',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Monthly Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${calculate_monthly()} \$ ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  // color: Theme.of(context).secondaryHeaderColor,
                ),
                child: ListView.builder(
                  itemCount: time.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      // color: Theme.of(context).primaryColor,
                    ),
                    child: ListTile(
                      leading: Text(
                        method[index],
                        style: TextStyle(fontSize: 15),
                      ),
                      title: Text(
                        desc[index].toUpperCase(),
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      subtitle: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          '${time[index]}  ${date[index]}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              amount[index],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: type[index] == "Debit"
                                      ? const Color.fromARGB(255, 241, 57, 44)
                                      : const Color.fromARGB(255, 64, 238, 72)),
                            ),
                            TextButton(
                              onPressed: () {
                                final del = context.read<Providerr>();
                                del.delete(index);
                                Future.delayed(Duration(milliseconds: 500));
                                setState(() {});
                              },
                              child: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
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
