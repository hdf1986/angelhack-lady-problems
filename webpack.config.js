// Todo a public
// Css transpilado como js
// Ecmascript 6
// React
// Bootstrap
// Fontawesome
// Todo desde paquetes de npm

var path = require('path');
var fs = require('fs');
var nodeModules = {};

console.log('Loaded webpack!');

fs.readdirSync(path.resolve(__dirname, 'node_modules'))
    .filter(x => ['.bin'].indexOf(x) === -1)
    .forEach(mod => { nodeModules[mod] = `commonjs ${mod}`; });

module.exports = {
  entry: './bin/mugi.js',
  target: 'node',
  output: {
    path: path.join(__dirname, 'tmp', 'build'),
    filename: 'mugi.js'
  },
  externals: nodeModules,
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /(node_modules)/,
        loader: 'babel', // 'babel-loader' is also a valid name to reference
        query: {
            presets: ['es2015']
        }
      }
    ]
  }
}