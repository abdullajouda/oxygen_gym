import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:oxygen/models/settings.dart';
import 'package:oxygen/widgets/back_button.dart';
import 'package:oxygen/widgets/directions.dart';
import 'package:oxygen/widgets/keyboard_dismesser.dart';
import 'package:oxygen/services/Localization/localization.dart';
import 'package:oxygen/widgets/menu_button.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AboutUs extends StatefulWidget {
  final VoidCallback openMenu;

  const AboutUs({Key key, this.openMenu}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  YoutubePlayerController _videoController;
  TextEditingController _idController;
  TextEditingController _seekToController;
  ScrollController _controller;
  double _value = 0.0;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  void _scrollListener() {
    setState(() {
      _value = _controller.offset;
    });
  }

  @override
  void initState() {
    var set = Provider.of<SettingsOperation>(context, listen: false);
    String videoID =
        YoutubePlayer.convertUrlToId(set.settingsModel.about.video);

    _videoController = YoutubePlayerController(
      initialVideoId: '$videoID',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_videoController.value.isFullScreen) {
      setState(() {
        _playerState = _videoController.value.playerState;
        _videoMetaData = _videoController.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _videoController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    _videoController.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var set = Provider.of<SettingsOperation>(context);
    Size size = MediaQuery.of(context).size;
    return Direction(
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Row(
                  children: [
                    MenuButton(
                      onTap: widget.openMenu,
                    ),
                    Text(
                      'About Us'.trs(context),
                      style: TextStyle(
                        fontSize: 32,
                        color: const Color(0xff1d3400),
                        letterSpacing: 0.38588235473632815,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            YoutubePlayer(
              controller: _videoController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              topActions: <Widget>[
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    '${'About Us'.trs(context)}',
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.35000000190734865,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
              onReady: () {
                _isPlayerReady = true;
              },
              onEnded: (data) {},
              bottomActions: [],
            ),
            Expanded(
                child: ListView(
              controller: _controller,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Html(
                      data: set.settingsModel.about.description
                              .replaceAll("\\r\\n", '') ??
                          '',
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
