class MugiController {
  constructor (req, res) {
    this._res = res;
    this._req = req;
    this._rendered = false;
  }

  helper () {
    return new MugiHelper();
  }

  render (name) {
    this.renderView(name);
    this._rendered = true;
  }

  renderView (view){
    console.log(this.injectables());
    this._res.render(view, {})
  }

  renderText(text) {
    this._res.send(text);
    this._rendered = true;
  }

  viewFor (controller, action) {
    var controllerName = (controller.name).replace("Controller", "").toLowerCase()
    return `${controllerName}/${action}.pug`;
  }

  injectables () {
    var injects = {};
    return injects;
  }

  get req () { this._req };
  set req (value) { this._req = value; };

  get res () { this._res };
  set res (value) { this._res = value; };
}

export { MugiController }