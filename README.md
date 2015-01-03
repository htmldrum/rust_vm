rust_vm
=======

Vagrant VM for playing with latest Rust builds.

Usage
-----

    $ git clone git@github.com:htmldrum/rails_vm.git
    $ cd rails_vm
    $ vagrant up
    $ vagrant ssh

TODO
--------

* Install deps from htmldrum/rust.git: Debian 5 ships with gcc 4.6.3

``vagrant@vagrant:~$ gcc --version
gcc (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3``
``The selected GCC C++ compiler is not new enough to build LLVM. Please upgrade
to GCC 4.7. You may pass --disable-compiler-version-checks to configure to
bypass these sanity checks.
configure: error: LLVM configure failed``


Requires
--------

* [Virtual Box][1]
* [Vagrant][2]


Notes
-----

This setup is based on the [Htmldrum fork for teaching staticly typed compiled languages at NYPL][3] fork. First provision will take a while ( we're  setting the table before dinner ), after that just `vagrant ssh` the live machine.

Feel free to install any of the previous games we've made in PyGame or ChocolateDoom: good practise for working with production servers.

Compatibility
-------------

Tested on Vagrant 1.6.3 and Virtual Box 4.3.18.


License
-------

MIT License.


Contributing
------------

Go ahead and submit a Pull Request. Thank you!


Related Reading
---------------

[1]: https://www.virtualbox.org/
[2]: http://www.vagrantup.com/
[3]: https://github.com/htmldrum/rust
