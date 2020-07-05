
import 'package:flutter/material.dart';
import 'package:tiktokuiflutter/domain/model/user.dart';
import 'package:tiktokuiflutter/video/video_labels.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget{

  bool isCurrent;
  bool isForYou;
  User user;

  Video({ this.isForYou, this.isCurrent, this.user });

  @override
  State<StatefulWidget> createState() => _VideoState();
}

class _VideoState extends State<Video> {

  VideoPlayerController _videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;
  bool _showArrow;

  @override
  void initState() {
    _showArrow = false;
    super.initState();
    _videoPlayerController = VideoPlayerController.asset("assets/videos/${widget.user.albums.elementAt(0).videoName}.mp4"); //VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if(widget.isCurrent) {
        setState(() {
          _showArrow = false;
          _videoPlayerController.play();
          widget.isCurrent = false;
        });
    } else {
      if(_videoPlayerController != null && _videoPlayerController.value.isPlaying)
        setState(() {
          _videoPlayerController.seekTo(Duration.zero); //Reinicia o vídeo
          _videoPlayerController.pause();
        });
    }
      return Stack(
      children: <Widget>[
        Container(
          color: Colors.black, //purple
          child: GestureDetector(
            onTap: () => _changeVideoStatus(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      return AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController),
                      );
                    }
                    return Center(); //Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _changeVideoStatus(),
                  child: Opacity(
                    opacity: _showArrow ? 1 : 0,
                    child: Image.asset("assets/icons/arrow_tiktok.png", color: Colors.white30),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50), //50 tamanho do menuBottom (height)
          child: Column(
            children: <Widget>[
              VideoLabels(isForYou: widget.isForYou, videoIsPlaying: _videoPlayerController.value.isPlaying, user: widget.user), //Body
              Container(
                width: MediaQuery.of(context).size.width,
                height: 6,
                child: VideoProgressIndicator(
                    _videoPlayerController,
                    allowScrubbing: true,
                    colors: VideoProgressColors(backgroundColor: Colors.grey, playedColor: Colors.white)
                ),
              ),//Carregando o vídeo
            ],
          ),
        )
      ],
    );
  }

  void _changeVideoStatus(){
    setState(() {
      if(_videoPlayerController.value.isPlaying) {
        //_videoPlayerController.seekTo(Duration.zero); //Reinicia o vídeo
        _videoPlayerController.pause();
        _showArrow = true;
        widget.isCurrent = false;
      } else {
        _videoPlayerController.play();
        _showArrow = false;
        widget.isCurrent = true;
      }
    });
  }

}
