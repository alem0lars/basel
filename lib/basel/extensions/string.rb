# Custom {String} class extensions.
class String
  def phrase_end_signs
    ["!", "?", "."]
  end

  def phrase_ended?(signs = nil)
    Array(signs || phrase_end_signs).any? { |sign| self.end_with? sign }
  end

  def end_phrase_with!(sign)
    self.chop! while phrase_ended?
    self << sign
  end
end
