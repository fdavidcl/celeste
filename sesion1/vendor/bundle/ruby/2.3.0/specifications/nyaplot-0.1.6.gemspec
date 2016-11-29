# -*- encoding: utf-8 -*-
# stub: nyaplot 0.1.6 ruby lib

Gem::Specification.new do |s|
  s.name = "nyaplot"
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Naoki Nishida"]
  s.date = "2015-08-16"
  s.description = "Nyaplot is an Interactive plots generator based on Web technology like SVG, WebGL, and JavaScript. It enables us to create interactive plots interactively on IRuby notebook, a web-based Ruby environment. Nyaplot is totally web-based gem and plots can be embedded into Rails or Sinatra seemlesly. Supported charts include basic 2D plot, 3D plot, Map plot and plot for Biology. See nbviewer (http://nbviewer.ipython.org/github/domitry/nyaplot/blob/master/examples/notebook/Index.ipynb) to overview what plots can be created with nyaplot and how to do it."
  s.email = ["domitry@gmail.com"]
  s.homepage = "https://www.github.com/domitry/nyaplot"
  s.licenses = ["MIT"]
  s.post_install_message = "************************************************************************\nWelcome to Nyaplot\n\n ___/|\n o.O| \n (___)\n   U\n\nThank you for installing Nyaplot gem.\n\nWe strongly recommend you to install IRuby, an interactive\nRuby environment on web browser at the same time.\n\n$ gem install iruby\n\nIf you wonder how to use Nyaplot, see /path/to/nyaplot/examples/notebook\nand run `iruby notebook` in the directory.\nYou can find these notebook on your browser:\nhttp://nbviewer.ipython.org/github/domitry/nyaplot/blob/master/examples/notebook/Index.ipynb\n\nYou can also use nyaplot without IRuby like /path/to/nyaplot/examples/rb\nor on your browser:\nhttps://github.com/domitry/nyaplot/tree/master/examples/rb\n\nFeel free to raise Issue or Pull-request on GitHub.\nMost pull-request might be accepted unless it is broken or too destructive.\n\nEnjoy Nyaplot!\n************************************************************************\n"
  s.required_ruby_version = Gem::Requirement.new(">= 2.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Nyaplot is an interactive plots generator based on Web technology like SVG, WebGL, and JavaScript."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
