import 'package:azerox/app/core/core.dart';
import 'package:azerox/app/models/post_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher_string.dart';

typedef DownloadFileCallback = Future<String> Function(String networkUrl);

class PostItemWidget extends StatefulWidget {
  final PostItens model;
  const PostItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<PostItemWidget> createState() => _PostItemWidgetState();
}

class _PostItemWidgetState extends State<PostItemWidget> {
  // with AutomaticKeepAliveClientMixin {
  // @override
  // final wantKeepAlive = true;

  final audioController = AudioController();

  @override
  void initState() {
    super.initState();
    if (widget.model.codPostType == 2) {
      audioController.initNetwork(widget.model.postItem!);
    }
  }

  @override
  void dispose() {
    audioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return AnimatedBuilder(
      animation: audioController,
      builder: (context, child) {
        if (widget.model.codPostType == 1) {
          // TEXTO
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              HtmlWidget(
                widget.model.postItem ?? '',
                onTapUrl: (url) async {
                  await launchUrlString(
                    url,
                    mode: LaunchMode.externalApplication,
                  );
                  return true;
                },
                // style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
              // Linkify(
              //   text: widget.model.postItem ?? '',
              //   style: const TextStyle(color: Colors.black, fontSize: 15),
              //   linkStyle: const TextStyle(color: Colors.blue, fontSize: 15),
              //   options: LinkifyOptions(humanize: true),
              //   onOpen: (link) async {
              //     if (await canLaunchUrl(Uri.parse(link.url))) {
              //       await launchUrl(Uri.parse(link.url));
              //     } else {
              //       throw 'Could not launch $link';
              //     }
              //   },
              // ),
              const SizedBox(height: 10),
            ],
          );
        } else if (widget.model.codPostType == 3) {
          //IMAGEM
          final imgPost = widget.model.postItemMax ?? '';
          return CachedNetworkImage(
            width: 318,
            fit: BoxFit.cover,
            imageUrl: imgPost,
            placeholder: (context, url) {
              return const CupertinoActivityIndicator();
            },
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        } else if (widget.model.codPostType == 2) {
          //AUDIO
          return Column(
            children: [
              AudioPlayerWidget(audioController),
              const SizedBox(height: 10),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
