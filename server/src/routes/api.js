// Generated by CoffeeScript 1.11.1
(function() {
  var express, router;

  express = require('express');

  router = express.Router();

  router.get('/', function(req, res, next) {
    return res.send('这是首页');
  });

  router.get('/api', function(req, res, next) {
    return res.send('这是API');
  });

  module.exports = router;

}).call(this);

//# sourceMappingURL=api.js.map
