# Custom {String} class extensions.
class String
  def self.phrase_end_signs
    ["!", "?", "."]
  end

  def phrase_ended?(signs = nil)
    Array(signs || String.phrase_end_signs).any? { |sign| self.end_with? sign }
  end

  def end_phrase_with!(sign)
    self.chop! while phrase_ended?
    self << sign
  end

  def add_word(other)
    self << " #{other}" if !other.nil? && other.length > 0
    self
  end

  def delete_ansi_colors
    gsub(/\e\[(\d+)m/, "")
  end
end
