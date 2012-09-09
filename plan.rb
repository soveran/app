require "digest/sha1"
require "base64"

module Plan
  class App

    # Name of your project.
    def name
      "foo"
    end

    # List of dependencies. This list if a starting point, and you can
    # add more either now or later. For each gem, we'll include the
    # latest version if the final .gems manifest. Feel free to change
    # it at will.
    def gems
      %w(
        cuba
        cuba-contrib
        rack-protection
        mote
        shield
      )
    end

    def destination
      "#{name}/app.rb"
    end
  end

  class Readme < App
    def description
      "Basic Cuba App"
    end

    def destination
      "#{name}/README"
    end
  end

  class Makefile < App
    def destination
      "#{name}/makefile"
    end
  end

  class Config < App
    def destination
      "#{name}/config.ru"
    end
  end

  class Css < App
    def destination
      "#{name}/public/css/styles.css"
    end
  end

  class Home < App
    def destination
      "#{name}/views/home.mote"
    end
  end

  class Layout < App
    def destination
      "#{name}/views/layout.mote"
    end
  end
end

instructions = <<-EOS
  You have just created a Cuba application. Now, go ahead and install
  the dependencies with the following commands:

    $ cd #{Plan::App.new.name}
    $ make         # Creates a gemset and lists dependencies.
    $ make install # Installs dependencies

  Once you are done with the setup, run the webserver:

    $ rackup

  Now you can head to http://localhost:9292.

  In development mode, it is good to have your application code
  reloaded between requests. For that, we recommend the use of the
  shotgun gem:

    $ gem install shotgun
    $ shotgun

  Both shotgun and rackup use webrick by default. While it's a nice
  server, you may get faster responses with something like puma:

    $ gem install puma
    $ shotgun -s puma

  Now head to http://localhost:9393 to check your creation. Enjoy!
EOS

puts instructions
puts
