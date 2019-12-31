

import 'package:flutter/material.dart';
import 'package:food_app/models/comment.dart';
import 'package:food_app/models/global.dart';
import 'package:food_app/models/post.dart';

class Comments extends StatefulWidget {

  Comments({Key key, this.controller}) : super(key: key);

  final PageController controller;

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  static Post the_post = post1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      width: double.infinity,
      height: double.infinity,
      child: getComments(the_post.comments),
    );
  }

  Widget getComments(List<Comment> likes) {
    List<Widget> likers = [];
    DateTime now = DateTime.now();
    for (Comment comment in likes) {
      int hoursAgo = (now.hour) - (comment.dateOfComment.hour - 1);
      likers.add(new Container(
        // height: 45,
          padding: EdgeInsets.all(10),
          child: FlatButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      width: 30,
                      height: 30,
                      child: CircleAvatar(
                        backgroundImage: comment.user.profilePicture,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: comment.user.username,
                                  style: textStyleBold),
                              new TextSpan(text: ' ', style: textStyle),
                              new TextSpan(
                                  text: comment.comment, style: textStyle),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10, top: 20),
                              child: Text(hoursAgo.toString() + "h",
                                style: textStyleLigthGrey,),
                            ),
                            Container(
                              child: Text("like", style: textStyleLigthGrey,),
                              margin: EdgeInsets.only(right: 10, top: 20),
                            ),
                            Container(
                              child: Text("Reply", style: textStyleLigthGrey,),
                              margin: EdgeInsets.only(right: 10, top: 20),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment(0, 0),
                  children: <Widget>[
                    Container(
                        child: Icon(
                          Icons.favorite, color: Colors.black, size: 15,)),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.favorite,
                            color: comment.isLiked ? Colors.black : Colors
                                .white, size: 10),
                        onPressed: () {
                          setState(() {
                            comment.isLiked = comment.isLiked ? false : true;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
            onPressed: () {

            },
          )
      ));
    }
  }
}
