fs = require('fs')
gulp = require('gulp')
del = require('del')
uglify = require('gulp-uglify')
minifyCss = require('gulp-minify-css')
browserSync = require('browser-sync').create()
concat = require('gulp-concat')
#unCss = require('gulp-uncss')
runSequence = require('run-sequence')

assets = JSON.parse(fs.readFileSync('./assets.json'))

gulp.task('default',(callback)->
  runSequence(['clean'],['build'],['server','watch'],callback)
)
gulp.task('clean',(callback)->
  del(['./dist'],callback)
)
gulp.task('build',(callback)->
  runSequence(
    ['assetsJs','assetsCss','assetsFonts'],
    ['copyHtml','appCss','appJs'],
    callback)
)
#复制html文件
gulp.task('copyHtml',->
  gulp.src('./src/**/*.html')
  .pipe(gulp.dest('./dist/'))
)
#合并第三方js文件
gulp.task('assetsJs',->
  gulp.src(assets.assetsJs)
  .pipe(uglify())
  .pipe(concat('assets.js',{newline:';\n'}))
  .pipe(gulp.dest('./dist/assets/js/'))
)
#合并第三方css文件
gulp.task('assetsCss',->
  gulp.src(assets.assetsCss)
  .pipe(concat('assets.css',{newLine:';\n\n'}))
# .pipe(unCss())
  .pipe(gulp.dest('./dist/assets/css/'))
)
#合并字体文件
gulp.task('assetsFonts', ->
  gulp.src(assets.assetsFonts)
  .pipe(gulp.dest('./dist/assets/fonts/'))
)
gulp.task('appCss',->
  gulp.src(assets.appCss)
  .pipe(concat('app.css',{newLine:';\n\n'}))
  .pipe(gulp.dest('./dist/assets/css/'))
)
gulp.task('appJs', ->
  gulp.src(assets.appJs)
  .pipe(concat('app.js', {newLine: ';\n'}))
  .pipe(gulp.dest('./dist/assets/js/'))
)
gulp.task('server', ->
  browserSync.init({
    server:{
      baseDir:'./dist/'
    }
    port:4321
  })
)
gulp.task('watch',->
  gulp.watch('./src/**/*.*',['reload'])
)
gulp.task('reload',(callback)->
  runSequence(['build'],['reload-browser'],callback)
)
gulp.task('reload-browser',->
  browserSync.reload()
)


