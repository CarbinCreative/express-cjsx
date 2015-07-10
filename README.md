[express]: http://expressjs.com/
[coffee]: http://coffeescript.org/
[react]: http://facebook.github.io/react/
[isomorphic]: http://isomorphic.net/javascript

# express-cjsx

[![Dependency Status](https://img.shields.io/david/CarbinCreative/express-cjsx.svg?style=flat)](https://david-dm.org/CarbinCreative/express-cjsx)
[![Gratipay](http://img.shields.io/gratipay/lessthanthree.svg?style=flat)](https://gratipay.com/lessthanthree/)

[CoffeeScript][coffee] [React][react] component view engine for [Express][express] to create [isomorphic][isomorphic] applications.


## Requirements

  * [CoffeeScript][coffee] ~1.9.0
  * [React][react] ~0.13.3


### Install

```sh
npm install express-cjsx
```


### Usage

```coffee
{createEngine} = require 'express-cjsx'
app = do express
app.set 'view engine', 'cjsx'
app.engine 'cjsx', do createEngine
```

**Optional**: Passing options

```coffee
{createEngine} = require 'express-cjsx'
app = do express
app.set 'view engine', 'cjsx'
app.engine 'cjsx', createEngine extension: '.react.coffee'
```


### Options

| Option | Values | Default |
| :---------- | :------------------------------------------------------ | --------------------: |
| `extension` | Any file name extension with leading dot (i.e `.cjsx`)  | `".cjsx"`             |
| `beautify`  | Beautify HTML markup, *may affect performance*          | `false|off|no`        |
| `doctype`   | Any valid doctype, defaults to HTML5.                   | `"<!DOCTYPE html>"`   |
