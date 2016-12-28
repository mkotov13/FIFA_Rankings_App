import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'player.dart';
import 'player_service.dart';

@Component(
    selector: 'my-dashboard',
    templateUrl: 'dashboard_component.html',
    styleUrls: const ['dashboard_component.css'],
  directives: const [ROUTER_DIRECTIVES],
)

class DashboardComponent implements OnInit{
  List<Player> players;

  final PlayerService _playerService;

  DashboardComponent(this._playerService);

  Future<Null> ngOnInit() async {
    players = (await _playerService.getPlayers()).take(4).toList();
  }
}