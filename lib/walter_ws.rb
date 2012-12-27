module WalterWs
  VERSION = [0, 1, 0]
  class << self
    def version
      VERSION.join('.')
    end
  end
end
