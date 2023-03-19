import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mova_app/constants/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({required this.youtubeKey, super.key});
  final String youtubeKey;
  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final YoutubePlayerController _controller;
  Color primaryColor = AppColors.primary;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
    super.initState();
  }

  @override
  void deactivate() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      progressIndicatorColor: primaryColor,
      progressColors: ProgressBarColors(
        playedColor: primaryColor,
        bufferedColor: AppColors.greyScale100.withOpacity(0.5),
        handleColor: primaryColor,
        backgroundColor: AppColors.greyScale50.withOpacity(0.2),
      ),
    );
  }
}
