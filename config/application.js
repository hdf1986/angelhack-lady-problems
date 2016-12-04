import { MugiApplication } from '../lib/mugi/mugi_application';
import { Router } from './routes'

class Application extends MugiApplication {
  constructor(environment) {
    super(environment);
    this._router = new Router(this);
  }
}

export { Application };