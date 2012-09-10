# asink.

Automatically energy-efficient asynchronous programming of microcontrollers.

The current plan is to compile to C.  The language will be functional,
but ideally hide all of the confusing parts of functional languages.


Find working docs [in the wiki](https://github.com/corecode/asink/wiki).


## Mock syntax examples

Both should be compiled into asynchronous state machines that continue
execution when an event occurs.

    repeat every 1s:
      toggle pin PA5

Here a timer even should be configured automatically to fire every 1s.
Moreover, the compiler could determine that PA5's pin type should be
*output*.

    repeat forever:
      ch = read char from UART0
      write ch to UART1

This actually contains two events: one for *data ready to read* from
UART0, the other *space available to write* to UART1.



See Also
========
* ChucK, a strongly-timed audio language: http://chuck.cs.princeton.edu/
This might be useful as a reference for how some languages work with similar
features and primitives.
* Pd (Pure Data) is a dataflow language that is inherently asynchronous.
See: http://puredata.info/

