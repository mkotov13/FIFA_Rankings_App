import 'package:angular2/core.dart';

import 'player.dart';

@Component(
    selector: 'my-player-detail',
    template: '''
      <div *ngIf="player != null">
        <h2>{{player.name}} details</h2>
        <div><label>id: </label>{{player.id}}</div>
        <div>
          <label>name: </label>
          <input [(ngModel)]="player.name" placeholder="name">

        </div>
      </div>'''
)

class PlayerDetailComponent {
  @Input()
  Player player;
}