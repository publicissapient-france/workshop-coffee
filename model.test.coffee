module 'Player class'
test 'There is a class Player with an attribute score set with the constructor', ->
  ok Player?, 'There must be a class Player'
  equal Player?.length, 1, 'The constructor of class Player must take one parameter'
  player = new Player?(122)
  equal player?.score, 122, "player.score must return 122"

test 'The method increaseScore of the class Player increase the score', ->
  player = new Player?(540)
  ok player?.increaseScore?, 'There must be a method increaseScore'
  equal player?.increaseScore?.length, 1, 'The method increaseScore must take one parameter'
  player?.increaseScore?(26)
  equal player?.score, 566, 'player.score must return 566'
  player?.increaseScore?(1001)
  equal player?.score, 1567, 'player.score must return 1567'

test 'The method formatedScore return a textual representation of the score with no plural if score = 0', ->
  player = new Player?(0)
  ok player?.formattedScore?, 'There must be a method formattedScore'
  equal player?.formattedScore?.length, 0, 'The method formattedScore must not take any parameter'
  equal player?.formattedScore?(), '0 Point', "The method formattedScore must return the string '0 Point'"

test 'The method formatedScore return a textual representation of the score with no plural if score = 1', ->
  player = new Player?(1)
  equal player?.formattedScore?(), '1 Point', "The method formattedScore must return the string '1 Point'"

test 'The method formatedScore return a textual representation of the score with plural if score > 1', ->
  player = new Player?(2)
  equal player?.formattedScore?(), '2 Points', "The method formattedScore must return the string '2 Points'"

module 'Ship class'
test "There is a class Ship with 2 attributes x and y in the constructor, representing the position on the screen of the top-left corner of the ship", ->
  ship = new Ship?(12, 34)
  equal ship?.x, 12, "ship.x must return 12"
  equal ship?.y, 34, "ship.y must return 34"

test 'There is a class Ship, with 2 properties width and height', ->
  equal Ship?::width, 40, "Ship::width must be 40"
  equal Ship?::height, 30, "Ship::height must be 30"

test 'The method moveLeft of class Ship substract 10 to the x position of the ship', ->
  ship = new Ship?(25, 23)
  ok ship?.moveLeft?, 'ship must have a method moveLeft'
  equal ship?.moveLeft?.length, 0, 'The method moveLeft must not take any parameter'
  ship?.moveLeft?()
  equal ship?.x, 15, 'ship.x must be equal to 15'
  ship?.moveLeft?()
  equal ship?.x, 5, 'ship.x must be equal to 5'

test 'The method moveRight of class Ship add 10 to the x position of the ship', ->
  ship = new Ship?(15, 23)
  ok ship?.moveRight?, 'ship must have a method moveRight'
  equal ship?.moveRight?.length, 0, 'The method moveRight must not take any parameter'
  ship?.moveRight?()
  equal ship?.x, 25, 'ship.x must be equal to 25'
  ship?.moveRight?()
  equal ship?.x, 35, 'ship.x must be equal to 35'

module 'Alien class'
test 'There is a class Alien, taking 2 attributes x and y in the constructor,  representing the position on the screen of the top-left corner of the alien', ->
  ok Alien?, 'There must be a class Alien'
  equal Alien?.length, 2, 'The constructor of class Alien must take 2 parameters'
  alien = new Alien?(34, 67)
  equal alien?.x, 34, 'alien.x must be equal to 34'
  equal alien?.y, 67, 'alien.y must be equal to 34'

test 'There is a class Alien, with 2 properties height and width', ->
  equal Alien?::width, 30, 'Alien::width must be equal to 30'
  equal Alien?::height, 30, 'Alien::height must be equal to 30'

test 'an instance of Alien have a default number of live equals to 1', ->
  alien = new Alien?(12, 23)
  equal alien?.live, 1, 'alien.live must be equal to 1'

test 'The method isAlive of class Alien return true if alien has more than 0 live ', ->
  alien = new Alien?(4, 6)
  ok alien?.isAlive?, 'There must be a method isAlive on alien'
  equal alien?.isAlive?.length, 0, 'The method isAlive must not take any parameter'
  equal alien?.isAlive?(), true, 'The method isAlive must return true'

test 'The method isAlive of class Alien return false if alien has 0 live ', ->
  alien = new Alien?(4, 6)
  alien?.live = 0
  equal alien?.isAlive?(), false, 'If live of alien is 0, isAlive must return false'

test "The method move of class Alien add ten to x if the parameter value is 'right'", ->
  alien = new Alien?(20, 20)
  ok alien?.move?, 'There must be a method move'
  equal alien?.move?.length, 1, 'The method move must take one parameter'
  alien?.move?('right')
  equal alien?.x, 30, 'alien.x must be equal to 30'
  equal alien?.y, 20, 'alien.y must be equal to 20'

test "The method move of class Alien substract ten to x if the parameter value is 'left'", ->
  alien = new Alien?(20, 20)
  alien?.move?('left')
  equal alien?.x, 10, 'alien.x must be equal to 10'
  equal alien?.y, 20, 'alien.y must be equal to 20'

test "The method move of class Alien doesn't do anything if parameter isn't valid", ->
  alien = new Alien?(20, 20)
  alien?.move?('top')
  equal alien?.x, 20, 'alien.x must be equal to 20'
  equal alien?.y, 20, 'alien.y must be equal to 20'

test "The method move of class Alien add 40 to y if the parameter value is 'down'", ->
  alien = new Alien?(20, 20)
  alien?.move?('down')
  equal alien?.x, 20, 'alien.x must be equal to 20'
  equal alien?.y, 60, 'alien.y must be equal to 60'


test 'The method decreaseLive of class Alien decrease the live counter', ->
  alien = new Alien?(4, 6)
  ok alien?.decreaseLive?, 'There must be a method decreaseLive'
  equal alien?.decreaseLive?.length, 0, 'The method decreaseLive must not take any parameter'
  alien?.decreaseLive?()
  equal alien?.live, 0, 'alien.live must be equal to 0'

test 'The value of an alien is 10 points', ->
  alien = new Alien?(12, 23)
  equal alien?.value, 10, 'alien.value must be equal to 10'

module 'VeryBadAlien'
test 'There is a class VeryBadAlien which extend Alien and taking 2 attributes x and y in the constructor,  representing the position on the screen of the top-left corner of the very bad alien', ->
  ok VeryBadAlien?, 'There must be a class VeryBadAlien'
  equal VeryBadAlien?.length, 2, 'The constructor of class VeryBadAlien must take 2 parameters'
  veryBadAlien = new VeryBadAlien?(23, 45)
  ok Alien? && veryBadAlien instanceof Alien, 'The class VeryBadAlien must extend class Alien'
  equal veryBadAlien?.x, 23, 'veryBadAlien.x must be equal to 23'
  equal veryBadAlien?.y, 45, 'veryBadAlien.y must be equal to 45'

test 'A VeryBadAlien can move like an Alien', ->
  alien = new VeryBadAlien?(20, 20)
  alien?.move?('down')
  equal alien?.x, 20, 'alien.x must be equal to 20'
  equal alien?.y, 60, 'alien.y must be equal to 60'

test 'A new instance of VeryBadAlien has 2 lives', ->
  veryBadAlien = new VeryBadAlien?(23, 45)
  equal veryBadAlien?.live, 2, 'veryBadAlien.live must be equal to 2'

test 'The value of an veryBadAlien is 25 points', ->
  veryBadAlien = new VeryBadAlien?(10, 23)
  equal veryBadAlien?.value, 25, 'veryBadAlien.value must be equal to 25'

test 'A VeryBadAlien has a method mutate which return the current instance of VeryBadAlien', ->
  veryBadAlien = new VeryBadAlien?(10, 13)
  ok veryBadAlien?.mutate?, 'There must be a method mutate'
  equal veryBadAlien?.mutate?.length, 0, 'The method mutate must not take any parameter'
  ok veryBadAlien? && veryBadAlien?.mutate?() == veryBadAlien, 'The mutated veryBadAlien must be the same as the original veryBadAlien'

test 'An alien has a method mutate which return the corresponding VeryBadAlien', ->
  alien = new Alien?(10, 13)
  ok alien?.mutate?, 'There must be a method mutate in class Alien'
  equal alien?.mutate?.length, 0, 'The method mutate must not take any parameter'
  alienMutated = alien?.mutate?()
  ok VeryBadAlien? && alienMutated instanceof VeryBadAlien
  ok alien? && alienMutated? && alien?.x == alienMutated?.x, 'The x position of original and mutated alien must be the same'
  ok alien? && alienMutated? && alien?.y == alienMutated?.y, 'The y position of original and mutated alien must be the same'

test 'The VeryBadAlien class has a method to mutates a list of alien', ->
  veryBadAlien = new VeryBadAlien?(54, 78)
  aliens = [new Alien?(10, 13), veryBadAlien, new Alien?(23, 34)]
  ok VeryBadAlien?::mutates?, 'The class VeryBadAlien must have a static method mutates'
  equal VeryBadAlien?::mutates?.length, 1, 'the method mutates must take 1 parameter, the list of aliens'
  mutatedAliens = VeryBadAlien?::mutates?(aliens)
  equal mutatedAliens?.length, 3, 'The list of mutates aliens must contains 3 elements'
  isEveryAlienVeryBad = mutatedAliens?.every (alien) ->
    VeryBadAlien? && alien instanceof VeryBadAlien
  ok isEveryAlienVeryBad, 'After mutation, all aliens must be VeryBadAlien'
  equal mutatedAliens?[0].x, 10, 'the first alien must have his x position equal to 10'
  equal mutatedAliens?[0].y, 13, 'the first alien must have his y position equal to 13'
  ok mutatedAliens? && mutatedAliens?[1] == veryBadAlien, 'the second alien must be the same as the original veryBadAlien'
  equal mutatedAliens?[2].x, 23, 'the third alien must have his x position equal to 23'
  equal mutatedAliens?[2].y, 34, 'the third alien must have his y position equal to 34'

module 'class Ship.destroyAliens'
test 'The class Ship must have a method destroyAliens which decrease lives of n first aliens by 1, where n is the second parameters', ->
  ship = new Ship?(10, 20)
  aliens = [new Alien?(1, 1), new VeryBadAlien?(1, 2), new Alien?(1, 3)]
  ok ship?.destroyAliens?, 'ship must have a method destroyAliens'
  equal ship?.destroyAliens?.length, 2, 'The method destroyAliens must take 2 parameters, first the list of aliens, second the number of aliens impacted'
  ship?.destroyAliens?(aliens, 2)
  equal aliens[0]?.live, 0, 'The first alien must have lost 1 life'
  equal aliens[1]?.live, 1, 'The second alien must have lost 1 life'
  equal aliens[2]?.live, 1, 'The third alien must not have lost any life'

test 'The class Ship must have a method destroyAliens which decrease lives of aliens by 1', ->
  ship = new Ship?(10, 20)
  aliens = [new Alien?(1, 1), new VeryBadAlien?(1, 2), new Alien?(1, 3)]
  ship?.destroyAliens?(aliens, 5)
  equal aliens[0]?.live, 0, 'The first alien must have lost 1 life'
  equal aliens[1]?.live, 1, 'The second alien must have lost 1 life'
  equal aliens[2]?.live, 0, 'The third alien must have lost 1 life'

test 'The class Ship must have a method isAlive which is true by default', ->
  ship = new Ship?(10, 20)
  ok ship?.isAlive?, 'ship must have a method isAlive'
  equal ship?.isAlive?.length, 0, 'isAlive must not take any parameter'
  equal ship?.isAlive?(), true, 'ship.isAlive must return true'

test "The class Ship must have a method destroyAliens which destroy the ship if used more than 5 times", ->
  ship = new Ship?(10, 20)
  aliens = []
  ship?.destroyAliens?(aliens, 5)
  ship?.destroyAliens?(aliens, 5)
  ship?.destroyAliens?(aliens, 5)
  ship?.destroyAliens?(aliens, 5)
  equal ship?.isAlive?(), true, 'After 4 uses of destroyAliens, the ship must be alive'
  ship?.destroyAliens?(aliens, 5)
  equal ship?.isAlive?(), false, 'After 5 uses of destroyAliens, the ship must not be alive'

module 'Projectile'
test 'There is a class projectile with 2 attributes x and y in the constructor, representing the top left position of the projectile', ->
  ok Projectile?, 'There must be a class Projectile'
  equal Projectile?.length, 2, 'The class Projectile must take 2 parameters'
  projectile = new Projectile?(22, 33)
  equal projectile?.x, 22, 'Projectile.x must be equal to 22'
  equal projectile?.y, 33, 'Projectile.y must be equal to 33'

test 'There is a class Projectile, with 2 properties height and width', ->
  equal Projectile?::width, 5, 'Projectile::width must return 5'
  equal Projectile?::height, 10, 'Projectile::width must return 10'

test 'The class Ship has a method fire which create a new Projectile, and the coordinates of the projectile are centered on the ship', ->
  ship = new Ship?(10, 80)
  ok ship?.fire?, 'There must be a method fire on ship'
  equal ship?.fire?.length, 0, 'The method fire must not take any parameter'
  projectile = ship?.fire()
  ok Projectile? && projectile instanceof Projectile
  equal projectile?.x, 30, 'projectile.x must be equal to ship.x + ship.width / 2'
  equal projectile?.y, 80, 'projectile.y must be equal to ship.y'

test 'The class Projectile has a method move, which remove 10 to y coordinate', ->
  projectile = new Projectile?(22, 33)
  ok projectile?.move?, 'projectile must have a method move'
  equal projectile?.move?.length, 0, 'the method move must not take any parameter'
  projectile?.move?()
  equal projectile?.y, 23, 'projectile.x must be equal to 23'
  equal projectile?.x, 22, 'projectile.y must be equal to 22'

test 'There must be a method hasCollisionWith in the class Projectile, colliding at left', ->
  projectile = new Projectile?(100, 100)
  equal projectile?.hasCollisionWith?(new Alien(69,
    10)), false, 'There must not be any colision with an alien below the projectile'
  equal projectile?.hasCollisionWith?(new Alien(71,
    10)), false, 'There must not be any colision with an alien below the projectile'
  equal projectile?.hasCollisionWith?(new Alien(69,
    100)), false, 'There must not be any colision with an alien left of the projectile'
  ok projectile?.hasCollisionWith?(new Alien(71,
    100)), 'There must be a colision with an alien where left of projectile and right of the alien collide'

test 'There must be a method hasCollisionWith in the class Projectile, colliding at right', ->
  projectile = new Projectile?(100, 100)
  equal projectile?.hasCollisionWith?(new Alien(106,
    10)), false, 'There must not be any colision with an alien below the projectile'
  equal projectile?.hasCollisionWith?(new Alien(104,
    10)), false, 'There must not be any colision with an alien below the projectile'
  equal projectile?.hasCollisionWith?(new Alien(106,
    100)), false, 'There must not be any colision with an alien right of the projectile'
  ok projectile?.hasCollisionWith?(new Alien(104,
    100)), 'There must be a colision with an alien where right of projectile and left of the alien collide'

test 'There must be a method hasCollisionWith in the class Projectile, colliding at top', ->
  projectile = new Projectile?(100, 100)
  equal projectile?.hasCollisionWith?(new Alien(2,
    69)), false, 'There must not be any colision with an alien left of the projectile'
  equal projectile?.hasCollisionWith?(new Alien(2,
    71)), false, 'There must not be any colision with an alien left of the projectile'
  equal projectile?.hasCollisionWith?(new Alien(100,
    69)), false, 'There must not be any colision with an alien below the projectile'
  ok projectile?.hasCollisionWith?(new Alien(100,
    71)), 'There must be a colision with an alien where bottom of projectile and top of the alien collide'

test 'There must be a method hasCollisionWith in the class Projectile, colliding at bottom', ->
  projectile = new Projectile?(100, 100)
  equal projectile?.hasCollisionWith?(new Alien(2,
    111)), false, 'There must not be any colision with an alien left of the projectile'
  equal projectile?.hasCollisionWith?(new Alien(2,
    109)), false, 'There must not be any colision with an alien left of the projectile'
  equal projectile?.hasCollisionWith?(new Alien(100,
    111)), false, 'There must not be any colision with an alien over the projectile'
  ok projectile?.hasCollisionWith?(new Alien(100,
    109)), 'There must be a colision with an alien where top of projectile and bottom of the alien collide'

