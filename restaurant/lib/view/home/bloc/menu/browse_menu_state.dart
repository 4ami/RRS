import 'package:restaurant/data/models/menu.dart';
import 'package:restaurant/view/home/bloc/menu/menu_state.dart';

class BrowseMenuState {
  final List<MenuItem> menuItems;
  final MenuState menuState;

  const BrowseMenuState({
    this.menuItems = const [],
    this.menuState = const InitialBrowseMenuState(),
  });

  BrowseMenuState copyWith({List<MenuItem>? items, MenuState? state}) =>
      BrowseMenuState(
        menuItems: items ?? menuItems,
        menuState: state ?? menuState,
      );
}
