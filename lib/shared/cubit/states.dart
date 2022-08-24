abstract class NewsStates {

}

class AppInitialState extends NewsStates {

}
class AppBottomNavBarState extends NewsStates {

}

class NewsGetBusinessSuccessState extends NewsStates{

}
class NewsGetBusinessErrorState extends NewsStates{
  NewsGetBusinessErrorState(String error);

}
class NewsGetSportsSuccessState extends NewsStates{

}
class NewsGetSportsErrorState extends NewsStates{
  NewsGetSportsErrorState(String error);

}
class NewsGetScienceSuccessState extends NewsStates{

}
class NewsGetScienceErrorState extends NewsStates{
  NewsGetScienceErrorState(String error);

}
class NewDarkModeState extends NewsStates{

}
 class NewsGetSearchLoadingState extends NewsStates{

 }
 class NewsGetSearchSuccessState extends NewsStates{

 }
 class NewsGetSearchErrorState extends NewsStates{
  NewsGetSearchErrorState(String string);

 }