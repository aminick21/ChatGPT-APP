import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_assistant/screens/widgets/bottom_sheet.dart';

import '../../colors.dart';

class body extends StatelessWidget {
  const body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      //logo
      Container(
          height: 40,
          width: 140,
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 2),
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Image(image: AssetImage("assets/logo-long.png"),fit: BoxFit.fitWidth)),


      //bold heading text
      RichText(
        text: TextSpan(
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 40,color: MyColors.primary,height:1.1),
          children: [
            TextSpan(text: "Hello,"),
            TextSpan(text: " I am \n",style:GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 35,color:Colors.white),),
            TextSpan(text: "ChatGPT, \n",style:GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 35,color:Colors.white)),
            TextSpan(text: "a highly advanced language model developed by OpenAI."),
          ],
        ),),


      //sub heading
      Text("I have been trained on a diverse range\nof internet text and my knowledge cutoff \nis 2021.",
        style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16
        ),
      ),

      //boxes
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20,bottom: 20,right: 20),
              height: 140,
              width: 220,
              decoration:BoxDecoration(
                color: MyColors.primary.withOpacity(.9),
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: Colors.white,)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment:Alignment.bottomRight,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),color: Colors.black
                      ),
                      child: Center(child: Text("1",style: TextStyle(color: Colors.white),),),
                    ),
                  ),

                  Text("Examples",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Text("\"Explain quantum\ncomputing in simple terms\"",style: GoogleFonts.montserrat(color: Colors.white,),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20,bottom: 20,right: 20),
              height: 140,
              width: 220,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white,),
                color: Colors.black.withOpacity(.1),
              ),
              child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment:Alignment.bottomRight,
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),color: Colors.black
                          ),
                          child: Center(child: Text("2",style: TextStyle(color: Colors.white),),),
                        ),
                      ),
                      Text("Capabilities",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Text("\"Remember what user\nsaid earlier in conversation\"",style: GoogleFonts.montserrat(color: Colors.white,),),
                    ],
                  ),

            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20,bottom: 20,right: 20),
              height: 140,
              width: 220,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white,),
                color: Colors.black.withOpacity(.1),

              ),
              child:
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment:Alignment.bottomRight,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),color: Colors.black
                        ),
                        child: Center(child: Text("3",style: TextStyle(color: Colors.white),),),
                      ),
                    ),
                    Text("Limitation",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text("\"May occasionally generate\n incorrect information\"",style: GoogleFonts.montserrat(color: Colors.white,),),
                  ],
                ),


              ),
          ],
        ),
      ),

      //button
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Center(
          child: MaterialButton(
            onPressed: (){
              showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  context: context, builder: (context)=>MyBottomSheet());

            },
            height: 80,
            minWidth: double.maxFinite,
            shape: RoundedRectangleBorder(
                side:BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Try ChatGPT",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),

          ),
        ),
      ),


      //  text
      Padding(padding: EdgeInsets.fromLTRB(0, 10, 0,0),
        child: Center(
          child: RichText(
            text: TextSpan(
              style: GoogleFonts.montserrat(fontSize: 12),
              children: const  [
                TextSpan(text: "ChatGPT Jan 30 version.",style: TextStyle(
                  decoration: TextDecoration.underline,
                  shadows: [
                    Shadow(
                        color: Colors.white,
                        offset: Offset(0, -5))
                  ],
                  color: Colors.transparent,
                  decorationColor: Colors.white,
                )),
                TextSpan(text: " Free Research Preview",style:TextStyle(
                  shadows: [
                    Shadow(
                        color: Colors.white,
                        offset: Offset(0, -5))
                  ],
                  color: Colors.transparent,
                  decorationColor: Colors.white,
                ),),
              ],
            ),),
        ),),



    ],
      );
  }
}