# -*- encoding: utf-8 -*-
# stub: gsl 2.1.0.1 ruby lib
# stub: ext/gsl_native/extconf.rb

Gem::Specification.new do |s|
  s.name = "gsl"
  s.version = "2.1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Yoshiki Tsunesada", "David MacMahon", "Jens Wille", "Daniel Mendler"]
  s.date = "2016-05-10"
  s.description = "Ruby/GSL is a Ruby interface to the GNU Scientific Library, for numerical computing with Ruby"
  s.email = "mail@daniel-mendler.de"
  s.extensions = ["ext/gsl_native/extconf.rb"]
  s.extra_rdoc_files = ["rdoc/linalg.rdoc", "rdoc/narray.rdoc", "rdoc/multiroot.rdoc", "rdoc/function.rdoc", "rdoc/ref.rdoc", "rdoc/stats.rdoc", "rdoc/hist3d.rdoc", "rdoc/sf.rdoc", "rdoc/monte.rdoc", "rdoc/tut.rdoc", "rdoc/bspline.rdoc", "rdoc/integration.rdoc", "rdoc/multimin.rdoc", "rdoc/complex.rdoc", "rdoc/combi.rdoc", "rdoc/changes.rdoc", "rdoc/sort.rdoc", "rdoc/interp.rdoc", "rdoc/randist.rdoc", "rdoc/roots.rdoc", "rdoc/vector_complex.rdoc", "rdoc/math.rdoc", "rdoc/siman.rdoc", "rdoc/alf.rdoc", "rdoc/graph.rdoc", "rdoc/poly.rdoc", "rdoc/hist.rdoc", "rdoc/cholesky_complex.rdoc", "rdoc/fft.rdoc", "rdoc/rng.rdoc", "rdoc/nonlinearfit.rdoc", "rdoc/const.rdoc", "rdoc/qrng.rdoc", "rdoc/ndlinear.rdoc", "rdoc/linalg_complex.rdoc", "rdoc/tensor.rdoc", "rdoc/matrix.rdoc", "rdoc/fit.rdoc", "rdoc/start.rdoc", "rdoc/dht.rdoc", "rdoc/nmatrix.rdoc", "rdoc/cheb.rdoc", "rdoc/intro.rdoc", "rdoc/perm.rdoc", "rdoc/wavelet.rdoc", "rdoc/odeiv.rdoc", "rdoc/vector.rdoc", "rdoc/min.rdoc", "rdoc/eigen.rdoc", "rdoc/ehandling.rdoc", "rdoc/ntuple.rdoc", "rdoc/hist2d.rdoc", "rdoc/blas.rdoc", "rdoc/diff.rdoc", "rdoc/sum.rdoc", "rdoc/use.rdoc", "tmp/i686-linux/stage/rdoc/linalg.rdoc", "tmp/i686-linux/stage/rdoc/narray.rdoc", "tmp/i686-linux/stage/rdoc/multiroot.rdoc", "tmp/i686-linux/stage/rdoc/function.rdoc", "tmp/i686-linux/stage/rdoc/ref.rdoc", "tmp/i686-linux/stage/rdoc/stats.rdoc", "tmp/i686-linux/stage/rdoc/hist3d.rdoc", "tmp/i686-linux/stage/rdoc/sf.rdoc", "tmp/i686-linux/stage/rdoc/monte.rdoc", "tmp/i686-linux/stage/rdoc/tut.rdoc", "tmp/i686-linux/stage/rdoc/bspline.rdoc", "tmp/i686-linux/stage/rdoc/integration.rdoc", "tmp/i686-linux/stage/rdoc/multimin.rdoc", "tmp/i686-linux/stage/rdoc/complex.rdoc", "tmp/i686-linux/stage/rdoc/combi.rdoc", "tmp/i686-linux/stage/rdoc/changes.rdoc", "tmp/i686-linux/stage/rdoc/sort.rdoc", "tmp/i686-linux/stage/rdoc/interp.rdoc", "tmp/i686-linux/stage/rdoc/randist.rdoc", "tmp/i686-linux/stage/rdoc/roots.rdoc", "tmp/i686-linux/stage/rdoc/vector_complex.rdoc", "tmp/i686-linux/stage/rdoc/math.rdoc", "tmp/i686-linux/stage/rdoc/siman.rdoc", "tmp/i686-linux/stage/rdoc/alf.rdoc", "tmp/i686-linux/stage/rdoc/graph.rdoc", "tmp/i686-linux/stage/rdoc/poly.rdoc", "tmp/i686-linux/stage/rdoc/hist.rdoc", "tmp/i686-linux/stage/rdoc/cholesky_complex.rdoc", "tmp/i686-linux/stage/rdoc/fft.rdoc", "tmp/i686-linux/stage/rdoc/rng.rdoc", "tmp/i686-linux/stage/rdoc/nonlinearfit.rdoc", "tmp/i686-linux/stage/rdoc/const.rdoc", "tmp/i686-linux/stage/rdoc/qrng.rdoc", "tmp/i686-linux/stage/rdoc/ndlinear.rdoc", "tmp/i686-linux/stage/rdoc/linalg_complex.rdoc", "tmp/i686-linux/stage/rdoc/tensor.rdoc", "tmp/i686-linux/stage/rdoc/matrix.rdoc", "tmp/i686-linux/stage/rdoc/fit.rdoc", "tmp/i686-linux/stage/rdoc/start.rdoc", "tmp/i686-linux/stage/rdoc/dht.rdoc", "tmp/i686-linux/stage/rdoc/nmatrix.rdoc", "tmp/i686-linux/stage/rdoc/cheb.rdoc", "tmp/i686-linux/stage/rdoc/intro.rdoc", "tmp/i686-linux/stage/rdoc/perm.rdoc", "tmp/i686-linux/stage/rdoc/wavelet.rdoc", "tmp/i686-linux/stage/rdoc/odeiv.rdoc", "tmp/i686-linux/stage/rdoc/vector.rdoc", "tmp/i686-linux/stage/rdoc/min.rdoc", "tmp/i686-linux/stage/rdoc/eigen.rdoc", "tmp/i686-linux/stage/rdoc/ehandling.rdoc", "tmp/i686-linux/stage/rdoc/ntuple.rdoc", "tmp/i686-linux/stage/rdoc/hist2d.rdoc", "tmp/i686-linux/stage/rdoc/blas.rdoc", "tmp/i686-linux/stage/rdoc/diff.rdoc", "tmp/i686-linux/stage/rdoc/sum.rdoc", "tmp/i686-linux/stage/rdoc/use.rdoc"]
  s.files = ["ext/gsl_native/extconf.rb", "rdoc/alf.rdoc", "rdoc/blas.rdoc", "rdoc/bspline.rdoc", "rdoc/changes.rdoc", "rdoc/cheb.rdoc", "rdoc/cholesky_complex.rdoc", "rdoc/combi.rdoc", "rdoc/complex.rdoc", "rdoc/const.rdoc", "rdoc/dht.rdoc", "rdoc/diff.rdoc", "rdoc/ehandling.rdoc", "rdoc/eigen.rdoc", "rdoc/fft.rdoc", "rdoc/fit.rdoc", "rdoc/function.rdoc", "rdoc/graph.rdoc", "rdoc/hist.rdoc", "rdoc/hist2d.rdoc", "rdoc/hist3d.rdoc", "rdoc/integration.rdoc", "rdoc/interp.rdoc", "rdoc/intro.rdoc", "rdoc/linalg.rdoc", "rdoc/linalg_complex.rdoc", "rdoc/math.rdoc", "rdoc/matrix.rdoc", "rdoc/min.rdoc", "rdoc/monte.rdoc", "rdoc/multimin.rdoc", "rdoc/multiroot.rdoc", "rdoc/narray.rdoc", "rdoc/ndlinear.rdoc", "rdoc/nmatrix.rdoc", "rdoc/nonlinearfit.rdoc", "rdoc/ntuple.rdoc", "rdoc/odeiv.rdoc", "rdoc/perm.rdoc", "rdoc/poly.rdoc", "rdoc/qrng.rdoc", "rdoc/randist.rdoc", "rdoc/ref.rdoc", "rdoc/rng.rdoc", "rdoc/roots.rdoc", "rdoc/sf.rdoc", "rdoc/siman.rdoc", "rdoc/sort.rdoc", "rdoc/start.rdoc", "rdoc/stats.rdoc", "rdoc/sum.rdoc", "rdoc/tensor.rdoc", "rdoc/tut.rdoc", "rdoc/use.rdoc", "rdoc/vector.rdoc", "rdoc/vector_complex.rdoc", "rdoc/wavelet.rdoc", "tmp/i686-linux/stage/rdoc/alf.rdoc", "tmp/i686-linux/stage/rdoc/blas.rdoc", "tmp/i686-linux/stage/rdoc/bspline.rdoc", "tmp/i686-linux/stage/rdoc/changes.rdoc", "tmp/i686-linux/stage/rdoc/cheb.rdoc", "tmp/i686-linux/stage/rdoc/cholesky_complex.rdoc", "tmp/i686-linux/stage/rdoc/combi.rdoc", "tmp/i686-linux/stage/rdoc/complex.rdoc", "tmp/i686-linux/stage/rdoc/const.rdoc", "tmp/i686-linux/stage/rdoc/dht.rdoc", "tmp/i686-linux/stage/rdoc/diff.rdoc", "tmp/i686-linux/stage/rdoc/ehandling.rdoc", "tmp/i686-linux/stage/rdoc/eigen.rdoc", "tmp/i686-linux/stage/rdoc/fft.rdoc", "tmp/i686-linux/stage/rdoc/fit.rdoc", "tmp/i686-linux/stage/rdoc/function.rdoc", "tmp/i686-linux/stage/rdoc/graph.rdoc", "tmp/i686-linux/stage/rdoc/hist.rdoc", "tmp/i686-linux/stage/rdoc/hist2d.rdoc", "tmp/i686-linux/stage/rdoc/hist3d.rdoc", "tmp/i686-linux/stage/rdoc/integration.rdoc", "tmp/i686-linux/stage/rdoc/interp.rdoc", "tmp/i686-linux/stage/rdoc/intro.rdoc", "tmp/i686-linux/stage/rdoc/linalg.rdoc", "tmp/i686-linux/stage/rdoc/linalg_complex.rdoc", "tmp/i686-linux/stage/rdoc/math.rdoc", "tmp/i686-linux/stage/rdoc/matrix.rdoc", "tmp/i686-linux/stage/rdoc/min.rdoc", "tmp/i686-linux/stage/rdoc/monte.rdoc", "tmp/i686-linux/stage/rdoc/multimin.rdoc", "tmp/i686-linux/stage/rdoc/multiroot.rdoc", "tmp/i686-linux/stage/rdoc/narray.rdoc", "tmp/i686-linux/stage/rdoc/ndlinear.rdoc", "tmp/i686-linux/stage/rdoc/nmatrix.rdoc", "tmp/i686-linux/stage/rdoc/nonlinearfit.rdoc", "tmp/i686-linux/stage/rdoc/ntuple.rdoc", "tmp/i686-linux/stage/rdoc/odeiv.rdoc", "tmp/i686-linux/stage/rdoc/perm.rdoc", "tmp/i686-linux/stage/rdoc/poly.rdoc", "tmp/i686-linux/stage/rdoc/qrng.rdoc", "tmp/i686-linux/stage/rdoc/randist.rdoc", "tmp/i686-linux/stage/rdoc/ref.rdoc", "tmp/i686-linux/stage/rdoc/rng.rdoc", "tmp/i686-linux/stage/rdoc/roots.rdoc", "tmp/i686-linux/stage/rdoc/sf.rdoc", "tmp/i686-linux/stage/rdoc/siman.rdoc", "tmp/i686-linux/stage/rdoc/sort.rdoc", "tmp/i686-linux/stage/rdoc/start.rdoc", "tmp/i686-linux/stage/rdoc/stats.rdoc", "tmp/i686-linux/stage/rdoc/sum.rdoc", "tmp/i686-linux/stage/rdoc/tensor.rdoc", "tmp/i686-linux/stage/rdoc/tut.rdoc", "tmp/i686-linux/stage/rdoc/use.rdoc", "tmp/i686-linux/stage/rdoc/vector.rdoc", "tmp/i686-linux/stage/rdoc/vector_complex.rdoc", "tmp/i686-linux/stage/rdoc/wavelet.rdoc"]
  s.homepage = "http://github.com/SciRuby/rb-gsl"
  s.licenses = ["GPL-2.0"]
  s.post_install_message = "\n    gsl can be installed with or without narray support. Please install\n    narray before and reinstall gsl if it is missing.\n\n    gsl is also now compatible with NMatrix. Please install nmatrix before\n    installing gsl.\n  "
  s.rdoc_options = ["--title", "Ruby/GSL (2.1.0.1)", "--charset", "UTF-8", "--line-numbers", "--all", "--main", "index.rdoc", "--root", "rdoc"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.requirements = ["GSL (http://www.gnu.org/software/gsl/)"]
  s.rubygems_version = "2.5.1"
  s.summary = "Ruby interface to the GNU Scientific Library"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.11"])
    else
      s.add_dependency(%q<rake-compiler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<test-unit>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.11"])
    end
  else
    s.add_dependency(%q<rake-compiler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<test-unit>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.11"])
  end
end
