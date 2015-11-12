require "erb"
require "ostruct"

class ErbRenderer < OpenStruct
  def self.render_from_hash(t, h)
    ErbRenderer.new(h).render(t)
  end

  def render(template)
    ERB.new(template).result(binding)
  end
end
