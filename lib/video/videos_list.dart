
//import 'package:connectivity/connectivity.dart'; //Or NetworkState lib
import 'package:flutter/material.dart';
import 'package:tiktokuiflutter/domain/model/user.dart';
import 'video.dart';

class VideosList extends StatefulWidget {

  bool controlKey;
  bool isForYou;
  List<User> users;

  VideosList({ this.controlKey, this.isForYou, this.users });

  @override
  State<StatefulWidget> createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> with AutomaticKeepAliveClientMixin {

  final _controller = ScrollController();
  List<double> _heights = new List<double>();
  double _screenHeight;
  double _totalHeight;
  int _index = 0;
  int _currentIndex = 0;
  bool _isCurrent = false;
  bool _isUserPause = false;

  List<int> numbers = [0,1,2,3,4];

  //bool _isConnected = true;

  @override
  void initState() {
    super.initState();
  }
  /*@override
  void initState() {
    super.initState();
    checkConnection().then((isConnected){
      setState(() {
        _isConnected = isConnected;
      });
    });
  }*/

  /*Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi)
      return Future<bool>.value(true);
    return Future<bool>.value(false);
  }*/

  @override
  Widget build(BuildContext context) {

    _screenHeight = MediaQuery.of(context).size.height;
    _totalHeight = _screenHeight * 5;
    for(int i=0; i<5; i++){
      _heights.add((_totalHeight / 5) * (i+1));
    }

    return showVideosList(users: widget.users);
  }

  Widget showVideosList({ List<User> users }){

    return NotificationListener(
      onNotification: (ScrollNotification notification){
        if (notification is ScrollEndNotification && notification.metrics.axis == Axis.vertical) {
          double currentPosition = !notification.metrics.pixels.isInfinite ? notification.metrics.pixels : 0;

          setState(() {
            _index = (currentPosition / _heights.elementAt(0)).round();
          });

          //print("pos: "+_index.toString());
          //print("currentPosition: "+currentPosition.toString());

          //Remover o pause adicionado pelo usuário
          if(currentPosition.round() == (_heights.elementAt(0) * (_currentIndex + 1) - _heights.elementAt(0)).round()){ //false para index atual
            setState(() {
              _isUserPause = false;
            });
          } else { //para index diferente do index atual
            if (currentPosition > (_heights.elementAt(0) * (_index + 1)) ||
                currentPosition < (_heights.elementAt(0) * (_index + 1))) {
              setState(() {
                _isUserPause = true;
              });
            } else {
              setState(() {
                _isUserPause = false;
              });
            }
          }
            //Faz a mesma coisa que PageScrollPhysics
          /*if(_index <= 4) {
            setState(() {
              _currentIndex = _index;
            });

            if (currentPosition < ((_heights.elementAt(0) * (_index + 1)) -
                (_heights.elementAt(0) / 2))) {
              //print("primeira parte");
              Future.delayed(const Duration(milliseconds: 100), () {})
                  .then((s) {
                _controller.animateTo(
                    _heights.elementAt(_index) - _heights.elementAt(0),
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease);
              });
            } else {
              //print("segunda parte");
              Future.delayed(const Duration(milliseconds: 100), () {})
                  .then((s) {
                _controller.animateTo(_heights.elementAt(_index),
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease);
              });
            }
          }*/
        }
        return false;
      },
      child: ListView.builder(
        //key: Key('${widget.isForYou ? 'FY' : 'F'}'),
        itemCount: users.length,
        controller: _controller,
        itemExtent: _heights.elementAt(0),
        physics: const PageScrollPhysics(),
        padding: EdgeInsets.only(top: 0),
        itemBuilder: (context, position){
          if(!widget.controlKey){
            _isCurrent = false;
          } else {
            if(_index == numbers.elementAt(position)){
              _currentIndex = _index; //Recebe o índice atual
              _isCurrent = true;
            } else {
              _isCurrent = false;
            }
          }

          //print("---------------------------------------");
          //print("_indexTeste: ${_indexTeste}");
          //print("numbers.elementAt(${position}): ${numbers.elementAt(position)}");

          return Column(
            mainAxisAlignment: MainAxisAlignment.end, //Alinhar no fim/bottom
            children: <Widget>[
              Container(
                //key: Key("${widget.isForYou ? 'FY' : 'F'}_${position}"),
                height: MediaQuery.of(context).size.height, // * 0.97
                child: Video( isForYou: widget.isForYou, isCurrent: _isCurrent, isUserPause: _isUserPause, user: users.elementAt(position)),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
