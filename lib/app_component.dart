// Copyright (c) 2016, Max. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular2/core.dart';

import 'player.dart';
import 'player_detail_component.dart';
import 'player_service.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <h2>My Players</h2>
    <ul class="players">
        <li *ngFor="let player of players"
            [class.selected]="player == selectedPlayer"
            (click)="onSelect(player)">
            <span class="badge">{{player.id}}</span> {{player.name}}
        </li>
    </ul>
    <my-player-detail [player]="selectedPlayer"></my-player-detail>
  ''',
    styles: const [
    '''
      .selected {
        background-color: #CFD8DC !important;
        color: white;
      }
      .players {
        margin: 0 0 2em 0;
        list-style-type: none;
        padding: 0;
        width: 10em;
      }
      .players li {
        cursor: pointer;
        position: relative;
        left: 0;
        background-color: #EEE;
        margin: .5em;
        padding: .3em 0em;
        height: 1.6em;
        border-radius: 4px;
      }
      .players li.selected:hover {
        color: white;
      }
      .players li:hover {
        color: #607D8B;
        background-color: #EEE;
        left: .1em;
      }
      .players .text {
        position: relative;
        top: -3px;
      }
      .players .badge {
        display: inline-block;
        font-size: small;
        color: white;
        padding: 0.8em 0.7em 0em 0.7em;
        background-color: #607D8B;
        line-height: 1em;
        position: relative;
        left: -1px;
        top: -4px;
        height: 1.8em;
        margin-right: .8em;
        border-radius: 4px 0px 0px 4px;
      }
    '''],
directives: const [PlayerDetailComponent],
providers: const [PlayerService]
)
class AppComponent implements OnInit {
  String title = 'Hill 119 FIFA Player Rankings';
  List<Player> players;
  Player selectedPlayer;

  final PlayerService _playerService;
  AppComponent(this._playerService);

  void ngOnInit () {
    getPlayers();
  }

  Future<Null> getPlayers() async {
    players = await _playerService.getPlayers();
  }

  void onSelect(Player player) {
    selectedPlayer = player;
  }
}
