require 'json'

# Hash-ish!
#
# This class is implemented using composition rather than inheritance so
# that we have control over what operations it exposes to peers.
class Hashish
  @elimination_max_recursive_time = 10

  class << self
    # (Shota) Hashish sometimes causes serious troubles so there are some cases
    # in which this should be convereted into Hash beforehand.
    def eliminate_hashish(obj)
      _convert_hashish_to_hash(obj, 1)
    end

    private

    def _convert_hashish_to_hash(obj, recursive_count)
      r = recursive_count
      return obj if r > @elimination_max_recursive_time

      if obj.is_a? Hashish
        obj = _convert_hashish_to_hash(obj.to_hash, r+1)
      elsif obj.is_a? Array
        obj.each_with_index {|v, i| obj[i] = _convert_hashish_to_hash(v, r+1) }
      elsif obj.is_a? Hash
        obj.each_key {|k| obj[k] = _convert_hashish_to_hash(obj[k], r+1) }
      elsif obj.instance_variables.size != 0
        obj.instance_variables.each do |v_name|
          v = obj.instance_variable_get(v_name)
          obj.instance_variable_set(v_name, _convert_hashish_to_hash(v, r+1))
        end
      end

      return obj
    end
  end


  include Enumerable

  # Hashish did not support all of json format! Hashish expects to have a
  # json which begins with "{" and ends with "}" so it can not deal with
  # json like Array:
  #
  #   [{ ... }, { ... },...]
  #
  # Now Hashish will envelop an target object if it receives an "Array" json.
  def initialize(hash={})
    if hash.is_a? Array
      hash = {data: hash}
    end
    @hash = hash.dup
    stringify_keys
    hashishify_values
  end

  def ==(other_obj)
    other_obj.class == self.class &&
    other_obj.to_hash == self.to_hash
  end

  def [](key)
    @hash[normalize(key)]
  end

  def []=(key, value)
    @hash[normalize(key)] = value
  end

  def dup
    Hashish.new(JSON.parse(@hash.to_json))
  end

  def each(&block)
    @hash.each(&block)
  end

  def empty?
    @hash.empty?
  end

  def has_key?(name)
    @hash.has_key? normalize(name)
  end

  def to_hash
    @hash
  end

  def keys
    @hash.keys
  end

  def length
    @hash.length
  end

  def merge(other_hash)
    Hashish.new(@hash.merge(other_hash))
  end

  def merge!(other_hash)
    @hash.merge! other_hash
    self
  end

  def to_json(obj)
    @hash.to_json(obj)
  end

  def to_s
    str = "{"
    @hash.each do |key, value|
      if value.kind_of? String
        value = "'#{value}'"
      elsif value.nil?
        value = "nil"
      elsif value.kind_of? Array
        value = "[#{value.join(", ")}]"
      end

      str += " #{key}: #{value},"
    end

    str = str[0...-1] + " }"
    str
  end

  def dig(*keys)
    @hash.dig(*keys)
  end

  private

  # Hashishify all the things!
  def hashishify_values
    @hash.each do |key, value|
      if @hash[key].kind_of? Hash
        @hash[key] = Hashish.new(value)
      elsif @hash[key].kind_of? Array
        @hash[key].each_index do |index|
          element = @hash[key][index]
          if element.kind_of? Hash
            @hash[key][index] = Hashish.new(element)
          end
        end
      end
    end
  end


  def normalize(key)
    if @hash.has_key? key
      key
    elsif key.is_a? Symbol
      key.to_s
    else
      key
    end
  end


  def stringify_keys
    keys = @hash.keys
    keys.each do |key|
      if key.is_a? Symbol
        @hash[key.to_s] = @hash.delete(key)
      end
    end
  end

end
