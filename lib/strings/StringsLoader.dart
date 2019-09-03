import 'package:quiz_app/strings/Strings.dart';
import 'package:quiz_app/strings/StringsFR.dart';
import 'package:quiz_app/strings/StringsES.dart';
import 'package:quiz_app/strings/StringsAR.dart';

class StringsLoader {

  String lang ;

  StringsLoader(String lang){
    this.lang = lang;
  }

  loadWinLoose(bool nx){
    switch (lang) {
      case "":
        switch (nx) {
          case true:
            return(Strings.win);
          case false:
            return(Strings.loose);
          }
          break;
      case "FR":
        switch (nx) {
          case true:
            return(StringsFR.win);
          case false:
            return(StringsFR.loose);
          }
          break;
      case "ES":
        switch (nx) {
          case true:
            return(StringsES.win);
          case false:
            return(StringsES.loose);
          }
          break;
      case "AR":
        switch (nx) {
          case true:
            return(StringsAR.win);
          case false:
            return(StringsAR.loose);
          }
          break;
    }
  }

  loadNext(bool nx){
    switch (lang) {
      case "":
        switch (nx) {
          case true:
            return(Strings.next);
          case false:
            return(Strings.result);
          }
          break;
      case "FR":
        switch (nx) {
          case true:
            return(StringsFR.next);
          case false:
            return(StringsFR.result);
          }
          break;
      case "ES":
        switch (nx) {
          case true:
            return(StringsES.next);
          case false:
            return(StringsES.result);
          }
          break;
      case "AR":
        switch (nx) {
          case true:
            return(StringsAR.next);
          case false:
            return(StringsAR.result);
          }
          break;
    }
  }

  loadResult(bool answer){
    switch (lang) {
      case "":
        switch (answer) {
          case true:
            return(Strings.correct);
          case false:
            return(Strings.wrong);
          }
          break;
      case "FR":
        switch (answer) {
          case true:
            return(StringsFR.correct);
          case false:
            return(StringsFR.wrong);
          }
          break;
      case "ES":
        switch (answer) {
          case true:
            return(StringsES.correct);
          case false:
            return(StringsES.wrong);
          }
          break;
      case "AR":
        switch (answer) {
          case true:
            return(StringsAR.correct);
          case false:
            return(StringsAR.wrong);
          }
          break;
    }
  }

  loadPlayAgain(){
    switch (lang) {
      case "":
        return(Strings.playAgain);
        break;
      case "FR":
        return(StringsFR.playAgain);
        break;
      case "ES":
        return(StringsES.playAgain);
        break;
      case "AR":
        return(StringsAR.playAgain);
        break;
    }
  }

  loadCategoryMenu(){
    switch (lang) {
      case "":
        return(Strings.categoryMenu);
        break;
      case "FR":
        return(StringsFR.categoryMenu);
        break;
      case "ES":
        return(StringsES.categoryMenu);
        break;
      case "AR":
        return(StringsAR.categoryMenu);
        break;
    }
  }

  loadAnswer(){
    switch (lang) {
      case "":
        return(Strings.answer);
        break;
      case "FR":
        return(StringsFR.answer);
        break;
      case "ES":
        return(StringsES.answer);
        break;
      case "AR":
        return(StringsAR.answer);
        break;
    }
  }

  loadCategories(String name) {
    switch (lang) {
      case "":
        return(Strings.getCategory(name));
        break;
      case "FR":
        return(StringsFR.getCategory(name));
        break;
      case "ES":
        return(StringsES.getCategory(name));
        break;
      case "AR":
        return(StringsAR.getCategory(name));
        break;
    }
  }

}
