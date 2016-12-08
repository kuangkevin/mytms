express = require('express');
router = express.Router();


router.get('/', (req, res, next) ->
  res.send('这是首页')
)
router.get('/api', (req, res, next) ->
  res.send('这是API')
)
module.exports = router
