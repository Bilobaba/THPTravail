require 'pp'
require 'digest'
require 'pry'

LEDGER = []

class Block
  attr_reader :index, :timestamp, :dat, :previous_hash, :hash, :nonce

  def initialize(index, data, previous_hash)
    @index = index
    @timestamp = Time.now
    @data = data
    @previous_hash = previous_hash
    @hash = compute_hash
    # @hash, @nonce = compute_hash_with_proof_of_work
  end

  def compute_hash_with_proof_of_work(difficulty="00")
    nonce = 0
    loop do
      hash = compute_hash_with_once(nonce)
      if hash.start_with?(difficulty)
        return [hash, nonce]
      else
        nonce +=1
        p nonce
      end
    end
  end

  def compute_hash
    sha = Digest::SHA256.new
    sha.update(@index.to_s + @timestamp.to_s + @data.to_s + @previous_hash.to_s)
    sha.hexdigest
    p sha
  end

  def self.first(data)
    Block.new(0,data,"0")
  end

  def self.next(previous, data=gets)
    Block.new(previous.index+1,data, previous.hash)
  end
end # class Block

def create_first_block
    i = 0
    instance_variable_set("@b#{i}", Block.first("THP"))
    LEDGER << @b0
    pp @b0
    add_block
end
def add_block
  i = 1
  loop do
      instance_variable_set("@b#{i}",Block.next(instance_variable_get("@b#{i-1}")))
      LEDGER << instance_variable_get("@b#{i}")
      p "=========================================="
      pp instance_variable_get("@b#{i}")
      p "=========================================="
      i+=1
  end
end


# create_first_block
# add_block
binding.pry

b0 = Block.first("THP")
b1 = Block.next(b0,"THPPP")
b2 = Block.next(b1, "More data")
b3 = Block.next(b2, "more more data")

pp [b0,b1,b2,b3]

