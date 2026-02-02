import 'package:chatbot/core/theme/app_style.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: Row(
      children: [
        Icon(CupertinoIcons.arrow_left),
        const SizedBox(
width: 17,

        ),
        Image.asset('assets/images/robot.png',width: 24,height: 36,fit: BoxFit.scaleDown,),
        const SizedBox(
width: 20,

        ),
        Column(

          children: [
            Text("ChatGPT",style: AppStyles.styleBold20(),),
            const SizedBox(
height: 2,

            ),
            Row(
              children: [
                SvgPicture.asset('assets/images/online.svg'),
                const SizedBox(
width: 2,

                ),
                Text("Online",style: AppStyles.styleMedium17(),),
              ],
            )


          ],
        )
      
      ,
      Spacer(),
      SvgPicture.asset('assets/images/voice.svg'),
    const  SizedBox(
width: 19,

      ),
      SvgPicture.asset('assets/images/upload.svg'),
      
      ],
      
      ),
    );
  }
}