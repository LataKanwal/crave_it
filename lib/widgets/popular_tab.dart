import 'package:crave_it/screens/product_screen.dart';
import 'package:flutter/material.dart';

class PopularTab extends StatelessWidget {
  final List<Map<String, String>> popularItems;

  const PopularTab({super.key,required this.popularItems});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        SizedBox(height: 20),
        Text(
          "Popular",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Most ordered right now",
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1
          ),
          itemCount: popularItems.length,
          itemBuilder: (context, index) {
            final item = popularItems[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=> ProductScreen(),
                  )
                );
                },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 2,
                    )
                  ]
                ),
                child: Stack(
                  children: [
                    Positioned(child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(item['image']!,
                          fit: BoxFit.cover,
                        height: 500,
                        width: 500 ,

                      ),
                    ),
                    ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors:[
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.3),
                                  Colors.transparent,
                                ],
                            begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                          ),
                        ),
                          child: Text(
                            item['title']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      )
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 30,
                        margin: EdgeInsets.all(10),
                        padding:EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item['price']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                              if(item.containsKey('oldPrice'))
                                Padding(padding: EdgeInsets.only(left:8),
                                child:Text(
                                  item['oldPrice']!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black26,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ) ,)
                          ],
                        )
                      ),
                      
                    )
                  ],
                ),
              ),

            );
          },
        )
      ],
    );
  }
}
