
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_assistant/colors.dart';
import 'package:smart_assistant/services/openAI_services.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {


  List<String> msg=[];


  TextEditingController controller=TextEditingController();

  OpenAIService openAIService=OpenAIService();

  int counter=0;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 50),
            curve: Curves.linear);
      }
    });
    return StatefulBuilder(
      builder: (context,setModalState){
        return  SizedBox(
          height: MediaQuery.of(context).size.height-150,
          child: SafeArea(
            child: Padding(
              padding:EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        controller: _scrollController,
                        itemCount: msg.length,
                        itemBuilder: (context,index){
                        if(index.isEven){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: MyColors.secondary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(msg[index],
                                    style: GoogleFonts.montserrat(fontSize: 16,color: Colors.white),)),
                            ),
                          );
                        }
                        else if(msg[index].contains('https')){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 400,width: 300,
                              child: Image(image: NetworkImage(msg[index]),fit: BoxFit.cover,),
                            ),
                          ),
                          );
                        }
                         else{
                           return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child:   Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: MyColors.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: AnimatedTextKit(
                                  isRepeatingAnimation: false,
                                    animatedTexts:[
                                      TyperAnimatedText(msg[index],
                                          textStyle: GoogleFonts.montserrat(fontSize: 16,color: Colors.white)
                                      ),

                                    ]),
                              ),
                            ),
                          );
                         }

                      }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        suffixIcon: GestureDetector(
                            onTap: () {

                              print(msg.length);
                              if (msg.length.isEven) {
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  msg.add(controller.text);
                                });

                                openAIService.mainAPI(controller.text).then((
                                    value) {
                                  setState(() {
                                    msg.add(value.toString());
                                  });
                                });

                                controller.clear();
                              }
                            },
                            child: Icon(Icons.send,color: MyColors.primary,)),
                        border:OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.secondary),
                          borderRadius: BorderRadius.circular(15),),
                          hintText: "Type Here!!"
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });

  }
}
