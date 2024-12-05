
import 'package:responsi_124220119/base_network.dart';
import 'package:responsi_124220119/game_model.dart';

abstract class GameView{
  void showLoading();
  void hideLoading();
  void showgameList(List<Games> gameList);
  void showError(String message);
}

class GamePresenter {
  final GameView view;
  GamePresenter(this.view);
  Future<void> loadGameData(String endpoint) async{
    try {
      final List<dynamic> data = await BaseNetwork.getData(endpoint);
      final gameList = data.map((json) => Games.fromJson(json)).toList();
      view.showgameList(gameList);
    } catch(e){
      view.showError(e.toString());
    } finally {
      view.hideLoading();
    }
  }
}