import { MugiRouter } from '../lib/mugi/mugi_router';
import { WelcomeController } from '../app/controllers/welcome_controller';

class Router extends MugiRouter {
  routes () {
    this.get('/', WelcomeController, "index")
  }
}

export { Router }