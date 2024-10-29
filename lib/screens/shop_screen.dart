import 'package:crave_it/widgets/popular_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController= TabController(length: 4, vsync: this,initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }
_handleTabSelection() {
    if(_tabController.indexIsChanging) {
      setState(() {});
    }
}  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  final List< String> categories =[
    "Popular" ,
    "Cricket Deals",
    "Strong Pepsi Deals",
    "All new"

  ];
   final List<Map <String, String>> popularItems = [
  {
    "title" : "Cricket Deal",
    "price" : " Rs.785.00",
    "oldPrice": "Rs. 999",
    "image": "assets/images/burger2.jpg"

},
    {
      "title" : "Cricket Deal",
      "price" : " Rs.785.00",
      "oldPrice": "Rs. 999",
      "image": "assets/images/burger3.jpg"

    },
    {
      "title" : "Cricket Deal",
      "price" : " Rs.785.00",
      "oldPrice": "Rs. 999",
      "image": "assets/images/burger4.jpg"
    },
    {
      "title" : "Chicken Korma",
      "price" : " Rs.785.00",
      "oldPrice": "Rs. 999",
      "image": "assets/images/burger.jpg"

    },
    {
      "title" : "Chicken Korma",
      "price" : " Rs.785.00",
      "oldPrice": "Rs. 999",
      "image": "assets/images/burger5.jpg"

    },
    {
      "title" : "Chicken Korma",
      "price" : " Rs.785.00",
      "oldPrice": "Rs. 999",
      "image": "assets/images/burger6.jpg"

    },
    {
      "title" : "Chicken Korma",
      "price" : " Rs.785.00",
      "oldPrice": "Rs. 999",
      "image": "assets/images/burger1.png"

    },
];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor:Color(0xDD7A343D),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              },
            icon: Icon(Icons.arrow_back,color :Colors.white,),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )
              ),
              Text(
                  "15-30 min",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  )
              )
            ],
          ),
          actions: [
            IconButton(onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
                color :Colors.white,

            ),
            ),
            IconButton(onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
                color :Colors.white,

              ),
            ),
            IconButton(onPressed: () {},
              icon: Icon(
                Icons.search,
                color :Colors.white,

              ),)
          ],

        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/burgerking.png",
                        height:  70,),
                      SizedBox(height: 8),
                      Text(
                        "Burger King",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: Text(
                        "1.5km away | Rs. 99.00 Delivery | Rs.249.00 Minimun Service fee applies",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                      ),
                      TextButton(onPressed: () {},
                          child: Text(
                            "More Info",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xDD770E1B),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star_outline,
                        color: Color(0xDD770E1B),
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "3.9",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "1000+ ratings",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "See Reviews",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xDD770E1B),
                            ),
                          ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                     CupertinoIcons.clock,
                        color: Color(0xDD770E1B),
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Delivery 15-30 min",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Change",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black26,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/voucher.png',
                        height: 25,
                        width: 25,
                        fit: BoxFit.cover,
                      ),

                      SizedBox(width: 10),
                      Text(
                        "Available deals",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin:EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xDD770E1B).withOpacity(0.07),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/percentage.png",
                              height: 25,
                                width: 25,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Rs. 320 off",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Color(0xDD770E1B),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height:8 ),
                        Text(
                          "Min order Rs. 320 Valid for selected items.\nAuto applied.",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height:16),
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    controller: _tabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    labelColor: Color(0xDD770E1B),
                    indicatorColor:Color(0xDD770E1B),
                    indicatorWeight: 3,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                    tabs: [
                      Tab(text: "Popular"),
                      Tab(text: "Cricket Deals"),
                      Tab(text: "Strong Pepsi Deals"),
                      Tab(text: "All New")
                    ]
                  ),
                  Center(
                    child: [
                      PopularTab(
                        popularItems: popularItems
                      ),
                      Center(
                        child: Text("Cricket Details Tab"),
                      ),
                      Center(
                        child: Text("Strong pepsi Deals Tab"),
                      ),
                      Center(
                        child: Text("All New Tab"),
                      ),
                      ][_tabController.index]
                  ),
                ],
              )
            )
          ],
        ),
      )
    );
  }
}
