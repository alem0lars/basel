# Custom {String} class extensions.
class String
  def phrase_end_signs
    ["!", "?", "."]
  end

  def phrase_ended?(sign = nil)
    Array(sign || phrase_end_signs).any? { |s| self.end_with? s }
  end

  def end_phrase_with(sign)
    self.chop! while phrase_ended?
    "#{self}#{sign}"
  end
end
