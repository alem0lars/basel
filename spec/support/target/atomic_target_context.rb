shared_context :atomic_target do
  def foo_target
    Basel::Target::Atomic.new :foo
  end

  def bar_target
    Basel::Target::Atomic.new :bar
  end

  def baz_target
    Basel::Target::Atomic.new :baz
  end

  def cafe_target
    Basel::Target::Atomic.new :cafe
  end

  def baby_target
    Basel::Target::Atomic.new :baby
  end
end
