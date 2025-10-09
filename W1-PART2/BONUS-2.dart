//function to handle matching brackets
bool bracketMatching(String contents){
  List<String> bracketCheck = [];
  
  for(var i = 0; i < contents.length; i++){
    var char = contents[i];
    if(char == '(' || char == '{' || char == '['){
        bracketCheck.add(char);
    }
    else if(char == ')' || char == '}' || char == ']'){
      //check if matching
      if(bracketCheck.isEmpty) return false;

      var last = bracketCheck.removeLast();
      if ((char == ')' && last != '(') ||
          (char == '}' && last != '{') ||
          (char == ']' && last != '[')) {
        return false;
        }
    }
  }
  return bracketCheck.isEmpty;
}

void main(){
  print(bracketMatching('{what is (42)}?') == true ? 'balance' : 'not balance');
  print(bracketMatching('[text}') == true ? 'balance' : 'not balance');
  print(bracketMatching('{[[(a)b]c]d}') == true ? 'balance' : 'not balance');
}