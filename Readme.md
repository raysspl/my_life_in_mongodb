My Life (in MongoDB)
====================

Setup
-----

    $ bundle install

Play time
---------

To run the project, load it up in irb (or pry):

    $ irb

    > require './app'

Now you can create you personal life history with:

    > MyLife.create!

And print it out (assuming you implemented that with):

    > MyLife.print

Since you in the REPL, you can experiment too. Try:

    > Timeline.count
    > Timeline.first.years

Have a look at the [Mongoid](http://mongoid.org) website for more inspiration.