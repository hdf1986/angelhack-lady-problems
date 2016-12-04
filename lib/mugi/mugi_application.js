import { MugiRouter } from './mugi_router';

class MugiApplication {
  constructor(environment){
    this._config = this.loadConfig(environment);
    this._router = new MugiRouter(this);
  }

  run () { 
    this.preload();
    this._router.start();
  }

  preload () {
    this._router.load();
  }

  loadConfig (environment) {
    return require(`../../config/environments/${environment}/application.js`)
  }
  get router () { this._router };
  set router (value) { this._router = value; };

  get config () { this._config };
  set config (value) { this._config = value; };
}
export { MugiApplication }