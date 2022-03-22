class IssnFormatter
  def self.format(issn)
    issn.include?("-") ? issn : fix_format(issn)
  end

  def self.fix_format(issn)
    issn.insert(4, "-")
  end
end
