import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:schedule/core/utils/app_assets.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dimension.dart';
import '../../../../core/utils/app_spaces.dart';

class VideoSection extends StatefulWidget {
  bool? isWebView;

  VideoSection({Key? key, this.isWebView = false}) : super(key: key);

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  // late VideoPlayerController _videoPlayerController;

  late YoutubePlayerController _youtubePlayerController;
  WebViewController? webViewController;

  String webUrl =
      "https://docs.google.com/presentation/d/e/2PACX-1vSHT_0Cd8VuUJUPb-joInf2-Dvs6rR1dH948rZbbVDGrJr69b3zR_RYO1x2EltWOA/pub?start=true&loop=true&delayms=3000&slide=id.p7";

  @override
  void initState() {
    print("Home-> initial state ...");
    super.initState();

    if (widget.isWebView == false) {
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: 'Ymp0Cst8oRU',
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
          disableDragSeek: true,
        ),
      );
    } else {
      webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0x00000000))
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(webUrl));
    }

    // _videoPlayerController = VideoPlayerController.asset(AppAssets.spa_video)
    //   ..initialize().then((_) {
    //     setState(() {});
    //
    //     _videoPlayerController.play();
    //     _videoPlayerController.setLooping(true);
    //
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //   });
  }

  @override
  dispose() {
    print("Home-> dispose ...  1 ");

    super.dispose();
    // _videoPlayerController.pause();
    // _videoPlayerController.dispose();
    print("Home-> dispose ...  2 ");
  }

  @override
  didUpdateWidget(old) {
    print("Home-> didUpdateWidget : ${old}");
    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isWebView! ? _webView() : _youtube_video();
  }

  _webView() {
    return AspectRatio(
      aspectRatio: 4 / 2,
      child: WebViewWidget(controller: webViewController!),
    );
  }

  _youtube_video() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppSpaces.spaces_height_20,
          // Padding(
          //   padding: const EdgeInsets.only(left: 16),
          //   child: Text(
          //     "Videos",
          //     style: TextStyle(
          //         color: AppColors.black,
          //         fontSize: AppDimension.h2,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
          AppSpaces.spaces_height_10,
          Padding(
            padding: EdgeInsets.all(16.0),
            child: YoutubePlayer(
              controller: _youtubePlayerController,
              onEnded: (end) {
                // _youtubePlayerController.reset();
                //
                // _youtubePlayerController.reload();
                _youtubePlayerController.play();
              },
              onReady: () {
                _youtubePlayerController.play();
              },
            ),
          )
        ],
      ),
    );
  }
}
