=======
lualtsv
=======

Labeled Tab-separated Values(`LTSV`_) parser for Lua

.. image:: https://api.travis-ci.org/zaneli/lualtsv.png?branch=master
   :target: https://travis-ci.org/zaneli/lualtsv

Installation
=======

Global
-------

::

    $ sudo luarocks install https://raw.githubusercontent.com/zaneli/lualtsv/master/lualtsv-0.0-1.rockspec

and add "/usr/local/share/lua/5.1/?.lua" directory to LAU_PATH, if necessary.

::

    $ export LUA_PATH="/usr/local/share/lua/5.1/?.lua;$LUA_PATH"

Local
-------

::

    $ luarocks --local install https://raw.githubusercontent.com/zaneli/lualtsv/master/lualtsv-0.0-1.rockspec

and add "$HOME/.luarocks/share/lua/5.1/?.lua" directory to LAU_PATH, if necessary.

::

    $ export LUA_PATH="$HOME/.luarocks/share/lua/5.1/?.lua;$LUA_PATH"

Usage
=======

load module.

::

    > require("lualtsv")

parsing LTSV
-------

::

    > t = ltsv.parse("name:zaneli\tvalue:v1:v2:v3")
    > for k, v in pairs(t) do
    >>   print(k .. " = " .. v)
    >> end
    name = zaneli
    value = v1:v2:v3

loading LTSV file
-------

::

    > ts = ltsv.load("file_path.ltsv")
    > for i, t in pairs(r) do
    >>   for k, v in pairs(t) do
    >>     print("[" .. i .. "]" .. k .. " = " .. v)
    >>   end
    >> end
    [1]name = zaneli
    [1]value = v1:v2:v3
    [2]foo = bar

dumping into LTSV
-------

::

    > s = ltsv.dump({ name = "zaneli", value = "v1:v2:v3" })
    > print(s)
    name:zaneli<TAB>value:v1:v2:v3

.. _`LTSV`: http://ltsv.org/

