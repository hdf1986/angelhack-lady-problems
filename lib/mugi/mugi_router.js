var path = require('path');
class MugiRouter {
  constructor (application) {
    this._application = application;
    this._express = require('express');
    this._app = this._express();
    this._app.set('view engine', 'pug')
    this._app.set('views', './app/views');
    this._app.use(this._express.static('public'));
  }

  load () {
    this.get = this._get;
    this.routes.bind(this)();
  }

  routes () { }


  start () {
    this._app.listen(this._application._config.port, function () {
      console.log(`${this._application._config.name} running on port ${this._application._config.port}`)
    }.bind(this))
  }

  _get (path, controller, action) {
    var self = this;
    this._app.get(path, (req, res) => {
      // Here commes the log
      var _controller = new controller(req, res);
      var _action = _controller[action];
      _action();
      _controller.renderView(_controller.viewFor(controller, action));
    });
  }
  
  get application () { this._application };
  set application (value) { this._application = value; };

  get express () { this._express };
  set express (value) { this._express = value; };

  get app () { this._app };
  set app (value) { this._app = value; };
}
export { MugiRouter }