import 'dart:async';

import 'package:angular2/core.dart';

import 'player.dart';
import 'mock_players.dart';

@Injectable()
class PlayerService {
  Future<List<Player>> getPlayers() async => mockPlayers;
}