vagrant_vm
==========

Vagrant VM for playing with latest vagrant builds.

Usage
-----

    $ git clone git@github.com:htmldrum/rails_vm.git
    $ cd rails_vm
    $ vagrant up
    $ vagrant ssh

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
