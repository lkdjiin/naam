Naam (THIS PROJECT IS NO LONGER MAINTENED)
================

Description
-----------
Naam is a toy language. This is a Naam to PIR compiler (PIR is an assembly
language for the Parrot Virtual Machine).

This is a work in progress, don't expect to much.

All this repository code is essentially a support for a series of
blog posts I wrote (in french) at http://lkdjiin.github.io/.

Install
-------------------------

Clone this repo.

Usage
--------------------------
Write this in a file named `sign.naam`:

    sign(n) ->
    1  if n > 0
    -1 if n < 0
    0  else
    
    print sign(4)

Then compile and run with:

    $ naam sign.naam
    1

###Naam's words

An identifier in Naam is called a word. A word starts with a
character that is not:

* A whitespace
* A parenthesis (opened or closed)
* A digit

A word ends on the first whitespace or parenthesis.

The following list are supposed to be valid words/ids in Naam:

* sign
* sign2
* !sign
* !
* .!=>
* ten-percent
* ten%
* ←
* ---

###Naam's keywords

There is 3 keywords: `if`, `else` and `print`. The character `;` is an alias to
`else`.

More to come…


Dependencies
--------------------------

  * ruby >= 2.0.0
  * [Parrot Virtual Machine](http://www.parrot.org/)

Contributing
-------------------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

License
--------------------------
Apache v2 License


Questions and/or Comments
--------------------------

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions, or contact me on [twitter](https://twitter.com/lkdjiin).
