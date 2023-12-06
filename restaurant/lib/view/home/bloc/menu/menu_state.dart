abstract class MenuState {
  String get stateMessage;
  const MenuState();
}

/// * [BrowseMenuStates] : all classes below represents the states of browse menu
class InitialBrowseMenuState extends MenuState {
  @override
  String get stateMessage => 'Initial State';
  const InitialBrowseMenuState();
}

class TriggerBrowseMenuState extends MenuState {
  @override
  String get stateMessage => 'Menu Items request is sent!';
}

class SuccessfulBrowseMenuState extends MenuState {
  @override
  String get stateMessage => 'Fetching Items success!';
}

class FailedBrowseMenuState extends MenuState {
  final String exception;
  @override
  String get stateMessage => exception.toString();
  const FailedBrowseMenuState({required this.exception});
}
