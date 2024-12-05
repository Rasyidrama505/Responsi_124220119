import 'package:flutter/material.dart';
import 'package:responsi_124220119/game_model.dart';
import 'package:responsi_124220119/game_presenter.dart';

class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes>
    implements GameView{
      late GamePresenter _presenter;
      bool _isLoading = false;
      List<Games> _gameList = [];
      String? _errorMessage;
      String _currentEndpoint = 'home';

      @override
    void initState(){
      super.initState();
      _presenter = GamePresenter(this);
      _presenter.loadGameData(_currentEndpoint);
    }

    void _fetchData(String endpoint){
      setState((){
        _currentEndpoint = endpoint;
        _presenter.loadGameData(endpoint);
      });
    }

  @override
  void hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void showgameList(List<Games> gameList) {
    _gameList = gameList;
  }

  @override
  void showError(String message) {
    _errorMessage = message;
  }

  @override
  void showLoading() {
    _isLoading = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nintendo Amibo List"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
            ],
          ),
          Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _errorMessage != null
                      ? Center(child: Text("Error : ${_errorMessage}"))
                      : ListView.builder(
                          itemCount: _gameList.length,
                          itemBuilder: (context, index) {
                            final amiibo = _gameList[index];
                            return ListTile(
                              leading: amiibo.image.isNotEmpty
                                  ? Image.network(amiibo.image)
                                  : Image.network(
                                      'https://placehold.co/600x400'),
                              title: Text(amiibo.character),
                              subtitle: Text('gameseries ${amiibo.gameseries}'),
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => DetailScreen(
                                //             id: anime.id,
                                //             endpoint: _currentEndpoint)));
                              },
                            );
                          }))
        ],
      ),
    );
  }
}