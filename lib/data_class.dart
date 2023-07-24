/*
the data is stored here 
*/
String lang="de";
List<String> questionList = [];
class Data{
int questionType=0;
String answer="";
@override
  String toString() {
    return questionType.toString()+"\n"+answer+"\n";
  }
}
List <Data> widgetList=[];