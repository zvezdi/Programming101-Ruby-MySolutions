class Hash

  def pick(*keys)
    select { |key, value| keys.include? key }
  end

  def except(*keys)
    reject { |key, value| keys.include? key }
  end

  def compact_values
    select { |key, value| value }
  end

  def defaults(hash)
    hash.merge(self).sort.to_h
  end

  def pick!(*keys)
    self.replace pick(*keys)
  end

end

p({a: 1, b: 2}.defaults(a: 4, c: 3))