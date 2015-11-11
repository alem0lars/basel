shared_context :composite_target do
  include_context :atomic_target

  def foobar_target
    Basel::Target::Composite.new foo_target, bar_target
  end

  def foobaz_target
    Basel::Target::Composite.new foo_target, baz_target
  end

  def foobarbaz_target
    Basel::Target::Composite.new foo_target, bar_target, baz_target
  end

  def foobarbaz_deep_target
    Basel::Target::Composite.new foobar_target, baz_target
  end

  def cafebaby_target
    Basel::Target::Composite.new cafe_target, baby_target
  end
end
