var page = require('webpage').create();
page.viewportSize = { width: 1366, height: 768 };

game_url = 'http://crawl.xtahua.com:8080/#watch-Charly';
game_url = 'http://crawl.akrasiac.org:8080/#watch-qw';

page.open(game_url, function () {
  setTimeout(function() {
    page.sendEvent('keypress', page.event.key.F12);
    setInterval(function() {
      page.render('/dev/stdout', { format: "png" });
      if (page.url != game_url)
      	phantom.exit()
    }, 250);
  }, 3000);
});

