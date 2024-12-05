
import 'package:responsi_124220119/base_network.dart';

abstract class GameDetailView {
  void showLoading();
  void hideLoading();
  void showDetailData(Map<String, dynamic> detailData);
  void showError(String message);
}

class GameDetailPresenter {
  final GameDetailView view;
  GameDetailPresenter(this.view);

  Future<void> loadDetailData(String endpoint, int id) async {
    view.showLoading();
    try {
      final data = await BaseNetwork.getDetailData(endpoint, id);
      view.showDetailData(data);
    } catch (e) {
      view.showError(e.toString());
    } finally {
      view.hideLoading();
    }
  }
}