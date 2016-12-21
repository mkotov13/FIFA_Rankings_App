import 'package:angular2/core.dart';

import 'package:angular2/router.dart';

import 'player_service.dart';
import 'players_component.dart';
import 'dashboard_component.dart';


@Component(
    selector: 'my-app',
    template: '''
      <h1>{{title}}</h1>
      <nav>
        <a [routerLink]="['Dashboard']">Dashboard</a>
        <a [routerLink]="['Players']">Players</a>
       </nav>
      <router-outlet></router-outlet>
    ''',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [PlayerService, ROUTER_PROVIDERS])

@RouteConfig(const [
  const Route(
      path: '/dashboard',
      name: 'Dashboard',
      component: DashboardComponent,
      useAsDefault: true),
  const Route(path: '/players', name: 'Players', component: PlayersComponent)
])

class AppComponent {
  String title = 'Hill 119 FIFA Player Rankings';
}
