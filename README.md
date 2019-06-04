Couchmentoring: EVERYONE can learn to code
================

[![Code Climate](https://codeclimate.com/github/Garllon/bennets_world/badges/gpa.svg)](https://codeclimate.com/github/Garllon/bennets_world)

# Prerequisites

I use Gosu for this test project.

So you need the SDL 2 library. Gosu is built on top of the SDL 2 library.

We must fix some Problems with RubyGems under Windows:
[SSL Problem](https://gist.github.com/luislavena/f064211759ee0f806c88)

For Mac use:
```
brew install sdl2
```

For Linux use:
```
apt-get install libsdl2-dev
```

Then install gosu:
```
gem install gosu
```

# Description

This is a project for my Couchmentoring.
You can start it with:
```
bundle exec ruby bennets_world.rb
```

# Versionen

Version 0.1.3
- is only the game, without special things

Version 0.2.1
- is with music, sliding background and a menu

Issues:
- Music toggle
- Score
- Time
- Weapons
