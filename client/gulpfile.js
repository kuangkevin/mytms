// Generated by CoffeeScript 1.11.1
(function() {
  var assets, browserSync, concat, del, fs, gulp, minifyCss, runSequence, uglify;

  fs = require('fs');

  gulp = require('gulp');

  del = require('del');

  uglify = require('gulp-uglify');

  minifyCss = require('gulp-minify-css');

  browserSync = require('browser-sync').create();

  concat = require('gulp-concat');

  runSequence = require('run-sequence');

  assets = JSON.parse(fs.readFileSync('./assets.json'));

  gulp.task('default', function(callback) {
    return runSequence(['clean'], ['build'], ['server', 'watch'], callback);
  });

  gulp.task('clean', function(callback) {
    return del(['./dist'], callback);
  });

  gulp.task('build', function(callback) {
    return runSequence(['assetsJs', 'assetsCss', 'assetsFonts'], ['copyHtml', 'appCss', 'appJs'], callback);
  });

  gulp.task('copyHtml', function() {
    return gulp.src('./src/**/*.html').pipe(gulp.dest('./dist/'));
  });

  gulp.task('assetsJs', function() {
    return gulp.src(assets.assetsJs).pipe(uglify()).pipe(concat('assets.js', {
      newline: ';\n'
    })).pipe(gulp.dest('./dist/assets/js/'));
  });

  gulp.task('assetsCss', function() {
    return gulp.src(assets.assetsCss).pipe(concat('assets.css', {
      newLine: ';\n\n'
    })).pipe(gulp.dest('./dist/assets/css/'));
  });

  gulp.task('assetsFonts', function() {
    return gulp.src(assets.assetsFonts).pipe(gulp.dest('./dist/assets/fonts/'));
  });

  gulp.task('appCss', function() {
    return gulp.src(assets.appCss).pipe(concat('app.css', {
      newLine: ';\n\n'
    })).pipe(gulp.dest('./dist/assets/css/'));
  });

  gulp.task('appJs', function() {
    return gulp.src(assets.appJs).pipe(concat('app.js', {
      newLine: ';\n'
    })).pipe(gulp.dest('./dist/assets/js/'));
  });

  gulp.task('server', function() {
    return browserSync.init({
      server: {
        baseDir: './dist/'
      },
      port: 4321
    });
  });

  gulp.task('watch', function() {
    return gulp.watch('./src/**/*.*', ['reload']);
  });

  gulp.task('reload', function(callback) {
    return runSequence(['build'], ['reload-browser'], callback);
  });

  gulp.task('reload-browser', function() {
    return browserSync.reload();
  });

}).call(this);

//# sourceMappingURL=gulpfile.js.map