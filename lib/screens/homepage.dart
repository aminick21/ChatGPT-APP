
import 'package:flutter/material.dart';
import 'package:smart_assistant/colors.dart';
import 'widgets/main_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String,String>> message=[];
  final textController=TextEditingController();
  final _controller=DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.secondary,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child:  Stack(
              children: [

                body(),


              ],
            ),
          ),

        ),
      ),
    );
  }
}



