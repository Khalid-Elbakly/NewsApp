abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppBottomNavState extends AppStates{}

class LoadingBusinessState extends AppStates{}

class BusinessSuccessState extends AppStates{}

class BusinessErrorState extends AppStates{
  final String error;

  BusinessErrorState(this.error);
}

class SportsSuccessState extends AppStates{}

class LoadingSportsState extends AppStates{}


class SportsErrorState extends AppStates {
  final String error;

  SportsErrorState(this.error);
}

class ScienceSuccessState extends AppStates{}

class LoadingScienceState extends AppStates{}


class ScienceErrorState extends AppStates {
  final String error;

  ScienceErrorState(this.error);
}

class SearchSuccessState extends AppStates{}

class LoadingSearchState extends AppStates{}


class SearchErrorState extends AppStates {
  final String error;

  SearchErrorState(this.error);
}

class ChangeModeState extends AppStates{}