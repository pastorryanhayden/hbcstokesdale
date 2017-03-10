var gulp = require('gulp');
var shell = require('gulp-shell');
var browserSync = require('browser-sync').create();

// Task for building blog when something changed:
gulp.task('build', shell.task(['bundle exec jekyll build --watch']));
// Or if you don't use bundle:
// gulp.task('build', shell.task(['jekyll build --watch']));

// Task for serving blog with Browsersync
gulp.task('serve', function () {
    browserSync.init({
        server: {baseDir: '_site/'},
        host: '0.0.0.0',
        open: false
    });
    // Reloads page when some of the already built files changed:
    gulp.watch('_site/**/*.*').on('change', browserSync.reload);
});

// Task for regenerating the page with princexml
gulp.task('prince', function () {
    gulp.watch('_site/**/*.*').on('change', shell.task(['prince -s _site/print.css _site/programs.html -o output.pdf && osascript scripts/refresh-preview.scpt']));
});

gulp.task('default', ['build', 'serve']);