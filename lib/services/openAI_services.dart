import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_assistant/secretkey.dart';
class OpenAIService{
   final List<Map<String,String>> messages=[];

  Future<String> mainAPI(String str) async{
    try{
      final response= await http.post(Uri.parse('https://api.openai.com/v1/chat/completions',),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $secretKey",},
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [{
            "role": "user",
            "content": "Does this message want to generate an AI picture, art, image or anything similar?"
                "'$str'"
                " simply answer with yes or no."}]
        }),);

      if(response.statusCode==200){
        var content=jsonDecode(response.body)['choices'][0]['message']['content'];
        content=content.trim();
        print(content);
        switch(content){
          case 'Yes':
          case 'yes':
          case 'Yes.':
          case 'yes.':
          case 'YES':
          case 'YES.':
            final res=await dallEAPI(str);
            print(res);
            return res;

          default:
            final res=await chatGptAPI(str);
            return res;

        }
      }
      return "An internal error occurred! ";

    }catch(e){
      return e.toString();
    }

  }

   Future chatGptAPI(String str) async{
    messages.add({
      'role':'user',
      'content':str,
    });

     try{

       final response= await http.post(Uri.parse('https://api.openai.com/v1/chat/completions',),
         headers: {
           "Content-Type": "application/json",
           "Authorization": "Bearer $secretKey",},
         body: jsonEncode({
           "model": "gpt-3.5-turbo",
           "messages": messages
         }),
       );
       if(response.statusCode==200){
         var content=jsonDecode(response.body)['choices'][0]['message']['content'];
         content=content.trim();
         messages.add({
             'role':'assistant',
             'content':content
           });
         return content;
         }
       return "An internal error occurred! ";



     }catch(e){
       return e.toString();
     }


   }

   Future dallEAPI(String str) async{
     messages.add({
       'role':'user',
       'content':str,
     });

     try{

       final response= await http.post(Uri.parse('https://api.openai.com/v1/images/generations',),
         headers: {
           "Content-Type": "application/json",
           "Authorization": "Bearer $secretKey",},
         body: jsonEncode({
           "prompt": str,
           "n": 1,
         }),
       );
       print(response.body);
       if(response.statusCode==200){
         var imageUrl=jsonDecode(response.body)['data'][0]['url'];
         imageUrl=imageUrl.trim();
         messages.add({
           'role':'assistant',
           'content':imageUrl
         });
         return imageUrl;
       }
       return "An internal error occurred! ";



     }catch(e){
       return e.toString();
     }
   }


}



