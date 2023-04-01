import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/Bhajan_audio_screen_controller.dart';

class AudioModule extends StatefulWidget {
    const AudioModule({Key? key}) : super(key: key);

  @override
  State<AudioModule> createState() => _AudioModuleState();
}

class _AudioModuleState extends State<AudioModule> {
   //final bhajanAudioScreenController = Get.find<BhajanAudioScreenController>();
   AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
   bool isPlaying = true ;
   Duration duration = Duration.zero;
   Duration position = Duration.zero;
@override
//   void initState(){
//   audioPlayer.onplayerStateChanged.listen((state){
//     setState(() {
//       isPlaying =  state == PlayerState.play;
//     });
//     audioPlayer.onDurationChanged.listen((newDuration){
//       setState(() {
//         duration = newDuration;
//       });
//     });
//
//     audioPlayer.onAudioPositionChanged.listen((newPosition){
//       setState(() {
//         position = newPosition;
//       });
//     });
//   });
//   super.initState();
// }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.music_note_outlined,
          size: 200,
        ),
         SizedBox(height: 2.h),
        const Text('Jab Yaad Tumhaari Aai 01'),
        SliderTheme(
          data: const SliderThemeData(
            trackHeight: 1,
          ),
          child: Slider(
            max: duration.inSeconds.toDouble(),
            min: 0.0,
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            value: position.inSeconds.toDouble(),
            onChanged: (value)  async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);
            },),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: const Icon(
                  CupertinoIcons.backward_end_alt_fill),
              onTap: (){
                audioPlayer.seekBy(const Duration(seconds: -10));
              //audioPlayer.seekBy(Duration(seconds: -10));
            },),
            //const Spacer(),
            IconButton(
              icon: Icon(
                isPlaying? Icons.pause_circle_outline : Icons.play_circle_outline,
              ),
              iconSize: 50,
              color: Colors.black, onPressed: () async{
                if(isPlaying){
                  await audioPlayer.play();
                }
                else{
                  await audioPlayer.pause();
                }
            },
            ),
            InkWell(child: const Icon(
                CupertinoIcons.forward_end_alt_fill),
              onTap: (){
                audioPlayer.seekBy(const Duration(seconds: 10));
                audioPlayer.seek(const Duration(seconds: 10));
                audioPlayer.next();
              //audioPlayer.seekBy(Duration(seconds: 10));
             // audioPlayer.seek(Duration(seconds: 10));
             // audioPlayer.next();
            },),
          ],
        ),
      ],
    );
  }
}



