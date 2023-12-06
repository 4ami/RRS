import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/data/models/menu.dart';
import 'package:restaurant/data/repositories/menu_repository.dart';
import 'package:restaurant/view/home/bloc/menu/browse_menu_state.dart';
import 'package:restaurant/view/home/bloc/menu/menu_event.dart';
import 'package:restaurant/view/home/bloc/menu/menu_state.dart';

class BrowseMenuBloc extends Bloc<MenuEvent, BrowseMenuState> {
  BrowseMenuBloc({required this.menuRepo}) : super(const BrowseMenuState()) {
    on<BrowsMenuEvent>(
      (event, emit) async {
        emit(state.copyWith(state: TriggerBrowseMenuState()));
        try {
          List<MenuItem> items = await menuRepo.getMenuItems();
          emit(state.copyWith(items: items));
          emit(state.copyWith(state: SuccessfulBrowseMenuState()));
        } catch (error) {
          emit(
            state.copyWith(
              state: FailedBrowseMenuState(exception: error as String),
            ),
          );
        }
      },
    );
  }

  final MenuServices menuRepo;
}
