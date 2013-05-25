## Créez vos classes ci dessous
class Player
  constructor: (@score) ->

  increaseScore: (points) ->
    @score += points

  formattedScore: ->
    "#{@score} Point" + if @score > 1 then 's' else ''

class Ship
  width:40
  height:30
  bombCount:0
  constructor: (@x, @y) ->

  moveLeft: ->
    @x -= 10

  moveRight: ->
    @x += 10

  destroyAliens: (aliens, numberOfImpacted) ->
    @bombCount++
    alien.decreaseLive() for alien in aliens[0..numberOfImpacted - 1]

  isAlive: -> @bombCount < 5

  fire: ->
    new Projectile(@x + @width/2, @y)

class Alien
  width:30
  height:30
  live:1
  value:10
  constructor: (@x, @y) ->

  isAlive: ->
    @live > 0

  move: (direction) ->
    switch direction
      when 'right' then @x += 10
      when 'left' then @x -= 10
      when 'down' then @y += 40

  decreaseLive: ->
    @live--

  mutate: -> new VeryBadAlien(@x, @y)

class VeryBadAlien extends Alien
  live:2
  value:25
  constructor: (@x, @y) -> super(@x, @y)

  mutate: -> @

  mutates: (aliens) ->
    alien.mutate() for alien in aliens


class Projectile
  width:5
  height:10
  constructor: (@x, @y) ->

  move: ->
    @y -= 10

  hasCollisionWith: (alien) ->
    !(@x + @width < alien.x || @x > alien.x + alien.width || @y + @height < alien.y || @y > alien.y + alien.height)

## Créez vos classes ci dessus
@Ship = Ship if Ship?
@Alien = Alien if Alien?
@VeryBadAlien = VeryBadAlien if VeryBadAlien?
@Projectile = Projectile if Projectile?
@Player = Player if Player?



