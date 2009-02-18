class String
  # Important: it do not work with self.tr("á", "a") in Ruby 1.8
  def chars
    { "á" => "a", "č" => "c", "ď" => "d",
      "ě" => "e", "é" => "e", "í" => "i",
      "ň" => "n", "ó" => "o", "ř" => "r",
      "š" => "s", "ť" => "t", "ú" => "u",
      "ů" => "u", "ý" => "y", "ž" => "z",
      "Á" => "A", "Č" => "C", "Ď" => "D",
      "Ě" => "E", "É" => "E", "Í" => "I",
      "Ň" => "N", "Ó" => "O", "Ř" => "R",
      "Š" => "S", "Ť" => "T", "Ú" => "U",
      "Ů" => "U", "Ý" => "Y", "Ž" => "Z" }
  end
  
  def to_ascii
    string = self.dup
    self.chars.each do |unicode, ascii|
      string.gsub!(/#{unicode}/u, ascii)
    end
    return string
  end
  
  def to_slug
    string = self.to_ascii.strip.downcase
    string.gsub!(/[ \t]+/, "-")    # replace blank chars by "-"
    string.gsub!(/-*(.+)-*/, '\1') # no "-" at begin or end
    string.delete!(%q{!@#$%^&*(){}[];:"'\|<>,./?]`~±})
    return string
  end
end
