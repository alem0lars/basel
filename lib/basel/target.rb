module Basel
  module Target
    autoload :Base,      'basel/target/base'
    autoload :Atomic,    'basel/target/atomic'
    autoload :Composite, 'basel/target/composite'

    INSTALL   = Atomic.new :install
    CONFIGURE = Atomic.new :configure
    SETUP     = Composite.new INSTALL, CONFIGURE
  end
end
