
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiktokuiflutter/domain/model/album.dart';
import 'package:tiktokuiflutter/domain/model/user.dart';
import 'package:tiktokuiflutter/video/videos_list.dart';
import 'package:tiktokuiflutter/widgets/menu_bottom.dart';

class PrincipalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {

  PageController _pageController;
  bool _isForYou;
  List<User> _forYou;
  List<User> _following;

  void setLists(){
    String name = 'Artist name - Album name - song';
    String description = 'Video description';
    List<User> users = [
      User(screenUser: "johnlennon", photo: "johnlennon", albums: [Album(name: name, videoName: 'building', description: description, likes: '6.8m', comments: '34.1k', shared: '500')]),
      User(screenUser: "robertaleal", photo: 'female_profile_1', albums: [Album(name: name, videoName: 'city-1', description: description, likes: '5.2m', comments: '23k', shared: '315')]),
      User(screenUser: "pedrosantos", photo: 'man_profile_2', albums: [Album(name: name, videoName: 'city-2', description: description, likes: '22.3k', comments: '11.1k', shared: '685')]),
      User(screenUser: "sayuoriyumi", photo: 'female_profile_5', albums: [Album(name: name, videoName: 'city-4', description: description, likes: '75.2k', comments: '45.8k', shared: '123')]),
      User(screenUser: "michael", photo: 'man_profile_3', albums: [Album(name: name, videoName: 'landscape-5', description: description, likes: '1.2m', comments: '43.9k', shared: '56')]),
      User(screenUser: "diogosantos", photo: 'man_profile_4', albums: [Album(name: name, videoName: 'landscape-2', description: description, likes: '3.8m', comments: '84.1k', shared: '48')]),
      User(screenUser: "fernandasouza", photo: 'female_profile_3', albums: [Album(name: name, videoName: 'landscape-3', description: description, likes: '90.5k', comments: '66.3k', shared: '789')]),
      User(screenUser: "akemisaionara", photo: 'female_profile_4', albums: [Album(name: name, videoName: 'landscape-4', description: description, likes: '12.3k', comments: '5.5k', shared: '654')]),
      User(screenUser: "anabessie", photo: 'female_profile_2', albums: [Album(name: name, videoName: 'landscape-1', description: description, likes: '85.1k', comments: '75.7k', shared: '945')]),
      User(screenUser: "sasukigoku", photo: 'man_profile_5', albums: [Album(name: name, videoName: 'rabbit', description: description, likes: '9.8m', comments: '12.6k', shared: '12')]),
    ];

    users = (users..shuffle());
    //List<String> all = ["building","city-1","city-2","city-4","landscape-1","landscape-2","landscape-3","landscape-4","landscape-5","rabbit"];
    //all = (all..shuffle());
    _forYou = users.getRange(0, 5).toList();
    _following = users.getRange(5, users.length).toList();
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
    setLists();
    _isForYou = true;
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            VideosList(controlKey: _isForYou, isForYou: _isForYou, users: _forYou),
            VideosList(controlKey: !_isForYou, isForYou: _isForYou, users: _following),
          ],
        ),
        Container( //Header-
          width: double.infinity,
          height: 125,
          //color: Colors.cyan,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => setState(() => {
                  _isForYou = false,
                  _pageController.jumpToPage(1),
                }),
                child: Text("Following", style: TextStyle(color: _isForYou ? Colors.white70 : Colors.white, fontSize: 17, decoration: TextDecoration.none, fontFamily: "Arial", fontWeight: _isForYou ? FontWeight.normal : FontWeight.bold)),
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: () => setState(() => {
                  _isForYou = true,
                  _pageController.jumpToPage(0),
                }),
                child: Text("For you", style: TextStyle(color: _isForYou ? Colors.white : Colors.white70, fontSize: 17, decoration: TextDecoration.none, fontFamily: "Arial", fontWeight: _isForYou ? FontWeight.bold : FontWeight.normal )),
              ),
            ],
          ),
        ),
        //Header(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //Video(videoIsPlaying: _controller.value.isPlaying), //Body
            MenuBottom()
          ],
        ),
      ],
    );
  }

}
