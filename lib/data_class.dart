/*
the data is stored here 
*/
String lang="fr";
List<int> size =[5,5,5];
List<String> questionList = [];
List<bool> questionAns = [];
List <Data> widgetList = [];
class Data{
int questionType=0;
String answer="";
@override
  String toString() {
    return questionType.toString()+"\n"+answer+"\n";
  }
}