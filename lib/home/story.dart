import 'package:flutter/material.dart';
import 'package:food_app/utils/utils.dart';

class StoriesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Positioned.fill(
                      child: index > 0
                          ? Image.asset("storyborder.png")
                          : Container(),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(40),
                          ),
                          child: Image.network(
                            Utils.image(forProfile: index == 0),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      width: 23,
                      bottom: 0,
                      right: 0,
                      child: index == 0
                          ? Image.asset("plus_blue.png")
                          : Container(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                index > 0 ? "Your best friend!!!" : "Your Story!",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
      itemExtent: 90,
      scrollDirection: Axis.horizontal,
      itemCount: 50,
    );
  }
}