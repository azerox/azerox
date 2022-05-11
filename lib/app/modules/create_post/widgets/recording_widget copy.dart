// import 'package:azerox/app/config/app_colors.dart';
// import 'package:azerox/app/core/core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controllers/create_post_controller.dart';

// class RecordingWidget extends StatefulWidget {
//   const RecordingWidget({Key? key}) : super(key: key);

//   @override
//   State<RecordingWidget> createState() => _RecordingWidgetState();
// }

// class _RecordingWidgetState extends State<RecordingWidget> {
//   final CreatePostController controller = GetInstance().find();
//   late final AudioController audioController = controller.audioController;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (!controller.recorderModule.isPaused) ...{
//               AnimatedBuilder(
//                 animation: controller.timerController,
//                 builder: (context, child) {
//                   return Text(
//                     controller.timerController.time,
//                     style: TextStyle(fontSize: 20),
//                   );
//                 },
//               ),
//             },
//             if (controller.recorderModule.isPaused) ...{
//               AnimatedBuilder(
//                 animation: audioController,
//                 builder: (context, child) {
//                   return Container(
//                     margin: const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: AppColors.grey.withAlpha(800),
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                     child: Row(children: [
//                       const SizedBox(width: 5),
//                       IconButton(
//                         icon: Icon(
//                           audioController.state == PlayerState.PAUSED
//                               ? Icons.play_arrow_rounded
//                               : Icons.pause,
//                           color: AppColors.grey,
//                           size: 30,
//                         ),
//                         onPressed: () {
//                           if (audioController.state == PlayerState.PLAYING) {
//                             audioController.pause();
//                           }
//                           if (audioController.state == PlayerState.PAUSED) {
//                             audioController.play();
//                           }
//                         },
//                       ),
//                       Expanded(
//                         child: Slider(
//                           activeColor: AppColors.primary,
//                           thumbColor: AppColors.primary,
//                           min: 0.0,
//                           max: audioController.duration.inMilliseconds
//                               .toDouble(),
//                           value: audioController.position.inMilliseconds
//                               .toDouble(),
//                           onChanged: (value) {
//                             audioController
//                                 .seek(Duration(milliseconds: value.toInt()));
//                           },
//                           onChangeStart: (value) {
//                             audioController.pause();
//                           },
//                           onChangeEnd: (value) {
//                             audioController.play();
//                           },
//                         ),
//                       ),
//                       Text(
//                         audioController.remainingTimeString,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       const SizedBox(width: 15),
//                     ]),
//                   );
//                 },
//               ),
//             },
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: controller.onCloseRecordDialogPressed,
//                     icon: Icon(Icons.delete),
//                     iconSize: 27,
//                     color: AppColors.grey,
//                   ),
//                   if (!controller.recorderModule.isRecording) ...{
//                     IconButton(
//                       onPressed: controller.record,
//                       icon: Icon(Icons.mic_rounded),
//                       iconSize: 35,
//                       color: Colors.red,
//                     ),
//                   },
//                   if (controller.recorderModule.isRecording) ...{
//                     InkWell(
//                       onTap: controller.pauseRecorder,
//                       borderRadius: BorderRadius.circular(100),
//                       splashColor: Colors.transparent,
//                       highlightColor: Colors.red.withOpacity(0.1),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: Icon(
//                           Icons.pause_circle_outline,
//                           size: 40,
//                           color: Colors.red,
//                         ),
//                       ),
//                     ),
//                   },
//                   FloatingActionButton(
//                     mini: true,
//                     onPressed: () {},
//                     child: Icon(Icons.check, size: 25),
//                     backgroundColor: AppColors.primary,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         );
//       },
//     );
//     // return Stack(
//     //   children: [
//     //     Container(
//     //       margin: const EdgeInsets.only(top: 20),
//     //       width: double.infinity,
//     //       height: 107,
//     //       color: AppColors.primary,
//     //       child: Row(
//     //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//     //         children: [
//     //           Center(
//     //             child: ValueListenableBuilder<int>(
//     //               valueListenable: controller.timerController,
//     //               builder: (_, value, __) => Text(
//     //                 controller.timerController.time,
//     //                 textAlign: TextAlign.center,
//     //                 style: const TextStyle(color: Colors.white),
//     //               ),
//     //             ),
//     //           ),
//     //           GestureDetector(
//     //             onTap: controller.onPlayPressed,
//     //             child: CircleAvatar(
//     //               backgroundColor: AppColors.green,
//     //               radius: 40,
//     //               child: CircleAvatar(
//     //                 backgroundColor: Colors.white,
//     //                 radius: 35,
//     //                 child: Row(
//     //                   children: [
//     //                     IgnorePointer(
//     //                       child: ElevatedButton(
//     //                         onPressed: controller.onPlayPressed,
//     //                         child: ValueListenableBuilder(
//     //                           valueListenable: controller.timerController,
//     //                           builder: (ctx, snapshot, _) => Icon(
//     //                             controller.timerController.isRunning
//     //                                 ? Icons.check
//     //                                 : Icons.play_arrow,
//     //                             color: AppColors.green,
//     //                           ),
//     //                         ),
//     //                         style: ButtonStyle(
//     //                           shape: MaterialStateProperty.all(
//     //                               const CircleBorder()),
//     //                           padding: MaterialStateProperty.all(
//     //                               const EdgeInsets.all(23)),
//     //                           backgroundColor:
//     //                               MaterialStateProperty.all(Colors.white),
//     //                         ),
//     //                       ),
//     //                     )
//     //                   ],
//     //                 ),
//     //               ),
//     //             ),
//     //           ),
//     //           IconButton(
//     //             icon: Icon(Icons.check, color: Colors.green),
//     //             // icon: Image.asset(AppImages.audio),
//     //             onPressed: controller.stopRecorder,
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //     Positioned(
//     //       left: 10,
//     //       top: 0,
//     //       child: GestureDetector(
//     //         onTap: controller.onCloseRecordDialogPressed,
//     //         child: const CircleAvatar(
//     //           backgroundColor: AppColors.green,
//     //           radius: 20,
//     //           child: CircleAvatar(
//     //             backgroundColor: Colors.white,
//     //             radius: 17,
//     //             child: Icon(
//     //               Icons.close,
//     //               size: 20,
//     //               color: Colors.red,
//     //             ),
//     //           ),
//     //         ),
//     //       ),
//     //     ),
//     //   ],
//     // );
//   }
// }
