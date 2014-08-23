# Frack MVC

Frack is a small example implementation of how to build a simple MVC style application from scratch.
Check out the commit history to see how I implemented it step-by-step.

It obviously lacks a lot of features compared to something like Rails and should not be used for production.
But for serving simple dynamic pages it should be fine.


## Rack it up!

When you clone the repo ```bundle``` and ```rackup``` should be enough to get the application running.
Then point your Browser to ```localhost:9292```.


## Homework for the curious ones

If you found to this repo because of my [talk](http://www.slideshare.net/DonSchado/froscon-rack), you may want to dive deeper.
Rebuilding features you get for free in Rails, is a great opportunity to learn how all this stuff works.
I for example, had a lot of _fun_ inside the rabbit hole of ActionView, figuring out how ```render``` is implemented.

So here is an incomplete and unordered list of possible extensions:

- implement redirect_to
- render partial: 'foo'
- implicit call to render
- routing with placeholders
- routing with specific http verbs
- error handling
- session management
- flash messages
- persistence
- security stuff and protection
- different mime types
- url helper
- better class loading / autoloading
- asset management
- ...

### => or just love the Rails core team for their amazing work! ;)
