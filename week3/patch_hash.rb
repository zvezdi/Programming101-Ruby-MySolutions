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
    #merge saves all elements in self and adds to them the elements 
    #in hash without replacing the values of already exsisting keys
    #I expected it works the other way around - saves the values of the hash
    #that it's called on and add new keys from the hash passed as parameter
    hash.merge(self).sort.to_h
  end

  def pick!(*keys)
    self.replace pick(*keys)
  end

end