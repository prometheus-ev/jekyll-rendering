jekyll-rendering
----------------
Jekyll plugin to provide alternative rendering engines.


## VERSION

This documentation refers to jekyll-rendering version 0.0.9


## DESCRIPTION

Jekyll plugin to provide alternative rendering engines.

Add the following to your `_plugins/ext.rb` file:

    require 'jekyll/rendering'

Then set `engine` in your `_config.yml`. The default engine is `liquid`.

Options passed to ERB.new are taken from `Jekyll::Rendering::ERB_OPTIONS`.
Modify this array if you want to change defaults.


## TODO

* Automatic engine detection by file extension? (`<NAME>.<FORMAT>.<ENGINE>`)


## LINKS

* Documentation :: http://rdoc.info/gems/jekyll-rendering
* Source code ::   http://github.com/prometheus-ev/jekyll-rendering
* RubyGem ::       http://rubygems.org/gems/jekyll-rendering


## AUTHORS

* Jens Wille <mailto:jens.wille@gmail.com>


## CREDITS

* Arne Eilermann <mailto:eilermann@lavabit.com> for the original idea
  and implementation.


## LICENSE AND COPYRIGHT

Copyright (C) 2010-2012 University of Cologne,
Albertus-Magnus-Platz, 50923 Cologne, Germany

Copyright (C) 2013 Jens Wille

jekyll-rendering is free software: you can redistribute it and/or modify it
under the terms of the GNU Affero General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your option)
any later version.

jekyll-rendering is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with jekyll-rendering. If not, see <http://www.gnu.org/licenses/>.
