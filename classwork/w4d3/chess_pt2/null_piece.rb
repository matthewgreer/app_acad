require 'singleton'
require_relative 'piece'

class NullPiece
    include Singleton

    attr_reader :color, :symbol

    def initialize
        
        
    end


end