var express = require('express');


var app = express();

app.configure(function () {
    app.use(express.bodyParser());
});


app.use(express.static(__dirname));

app.listen(3000);
console.log('go to http://localhost:3000/spaceinvaders.html to look at the game you\'re implementing');
console.log('go to http://localhost:3000/spaceinvaders.test.html to look at the test your code must pass');
