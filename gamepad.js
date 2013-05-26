var gamepadSupport = {
    ticking: false,
    gamepads: [],
    prevRawGamepadTypes: [],
    prevTimestamps: [],
    init: function() {
        var gamepadSupportAvailable = !!navigator.webkitGetGamepads 
                                        || !!navigator.webkitGamepads 
                                        || (navigator.userAgent.indexOf('Firefox/') != -1);

        if (!gamepadSupportAvailable) {
            console.log('GamePad API not supported');
        } else {
            window.addEventListener('MozGamepadConnected', gamepadSupport.onGamepadConnect, false);
            window.addEventListener('MozGamepadDisconnected', gamepadSupport.onGamepadDisconnect, false);
            if (!!navigator.webkitGamepads || !!navigator.webkitGetGamepads) {
                gamepadSupport.startPolling();
            }
        }
    },
    onGamepadConnect: function(event) {
        gamepadSupport.gamepads.push(event.gamepad);
        console.log('Gamepad connected');
        gamepadSupport.startPolling();
    },
    onGamepadDisconnect: function(event) {
        for (var i in gamepadSupport.gamepads) {
            if (gamepadSupport.gamepads[i].index == event.gamepad.index) {
                gamepadSupport.gamepads.splice(i, 1);
                break;
            }
        }
        if (gamepadSupport.gamepads.length == 0) {
            gamepadSupport.stopPolling();
        }
        console.log('Gamepad disconnected');
    },
    startPolling: function() {
        if (!gamepadSupport.ticking) {
            gamepadSupport.ticking = true;
            gamepadSupport.tick();
        }
    },
    stopPolling: function() {
        gamepadSupport.ticking = false;
    },
    tick: function() {
        gamepadSupport.pollStatus();
        gamepadSupport.scheduleNextTick();
    },
    scheduleNextTick: function() {
        if (gamepadSupport.ticking) {
            if (window.requestAnimationFrame) {
                window.requestAnimationFrame(gamepadSupport.tick);
            } else if (window.mozRequestAnimationFrame) {
                window.mozRequestAnimationFrame(gamepadSupport.tick);
            } else if (window.webkitRequestAnimationFrame) {
                window.webkitRequestAnimationFrame(gamepadSupport.tick);
            }
        }
    },
    pollStatus: function() {
        gamepadSupport.pollGamepads();
        for (var i in gamepadSupport.gamepads) {
            var gamepad = gamepadSupport.gamepads[i];
            if (gamepad.timestamp && (gamepad.timestamp == gamepadSupport.prevTimestamps[i])) {
                continue;
            }
            gamepadSupport.prevTimestamps[i] = gamepad.timestamp;
            gamepadSupport.updateGamePad(i);
        }
    },
    pollGamepads: function() {
        var rawGamepads = (navigator.webkitGetGamepads && navigator.webkitGetGamepads()) || navigator.webkitGamepads;
        if (rawGamepads) {
            gamepadSupport.gamepads = [];
            var gamepadsChanged = false;
            for (var i = 0; i < rawGamepads.length; i++) {
                if (typeof rawGamepads[i] != gamepadSupport.prevRawGamepadTypes[i]) {
                    gamepadsChanged = true;
                    gamepadSupport.prevRawGamepadTypes[i] = typeof rawGamepads[i];
                }
                if (rawGamepads[i]) {
                    gamepadSupport.gamepads.push(rawGamepads[i]);
                }
            }
            if (gamepadsChanged) {
                console.log('GamePads changing');
            }
        }
    },
    updateGamePad: function(gamepadId) {
        var gamepad = gamepadSupport.gamepads[gamepadId];
        var buttons = {
            CROIX : 0,
            LEFT: 14,
            RIGHT: 15,
            START: 9
        };

        var DOM_VK_LEFT = 37;
        var DOM_VK_RIGHT = 39;
        var DOM_VK_SPACE = 32;
        var DOM_VK_RETURN = 13;
            
        var buttonIsPressed = function (buttonId){
            return gamepad.buttons[buttonId] > 0 ;
        }
        if (typeof game != 'undefined' && game.state && game.state.ship){
            var ship = game.state.ship;

            if (buttonIsPressed(buttons.LEFT)  && ship.moveLeft){
                game.state.keyBindings[DOM_VK_LEFT]();
            }
            if (buttonIsPressed(buttons.RIGHT) && ship.moveRight){
                game.state.keyBindings[DOM_VK_RIGHT]();
            }
            if (buttonIsPressed(buttons.CROIX) && ship.fire){
                game.state.keyBindings[DOM_VK_SPACE]();
            } 
        } else {
            if (buttonIsPressed(buttons.START)){
                game.state.keyBindings[DOM_VK_SPACE]();
            }
        }
    }};

$(function(){
    gamepadSupport.init();
});
