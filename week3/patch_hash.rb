class Hash

  def pick(*keys)
    Hash.new.tap do 
      keys.each do |key|
        new_hash[key] = fetch(key) if has_key? key
      end
    end
  end

  def except(*keys)
    new_hash = {}
    each do |key, value|
      new_hash[key] = value unless keys.include? key
    end

    new_hash
  end

  def compact_values
    new_hash = {}
    each do |key, value|
      new_hash[key] = value if value
    end

    new_hash
  end

  def defaults(hash)
    new_hash = {}

    each do |key, value|
      new_hash[key] = value
    end

    hash.each do |key, value|
        new_hash[key] = value unless new_hash.has_key? key
    end

    new_hash
  end

  def pick!(*keys)
    #select! { |key, value| keys.include? key }

    #self

    self.replace pick(*keys)
  end

end

puts ({a: 1, b: 2, c: 3}.pick(:a, :b))