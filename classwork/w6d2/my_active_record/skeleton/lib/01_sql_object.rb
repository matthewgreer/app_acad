require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

    # If i were writing it on paper I would:
      # check if I had any information with which to create the table
      # if I didn't, I'd have to ask for it before I could go on
      # if I did, I'd:
        # look through the list of information
        # note the name of the table (make it an instance variable @table_name)
        # note the column names, and if the column value could be null or not
        # note if a column needed an index
      # then I'd:
        # make a NewTableWithTheNameInCamelCase
        # 

class SQLObject
  
  def self.columns
    @columns ||= []
    if @columns.length == 0
      query = DBConnection.execute2(<<-SQL)
          SELECT
            *
          FROM
            "#{self.table_name}"
      SQL
      column_strings = query.first
      column_symbols = column_strings.map {|str| str.to_sym}
      @columns = column_symbols
    end
    @columns
  end

  def self.finalize!
    self.columns.each do |column|

      define_method("#{column}") do 
        self.attributes[column] 
      end

      define_method("#{column}=") do |value| 
        self.attributes[column] = value 
      end

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name 
  end

  def self.table_name
    @table_name || ("#{self}").tableize 
  end

  def self.all
    
    query = DBConnection.execute2(<<-SQL)
          SELECT
            *
          FROM
            "#{self.table_name}"
    SQL
    query.drop(1).map 
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # debugger
    params.each do |col, value|
      attr_name = col.to_sym
      raise "unknown attribute '#{attr_name}'" if !self.class.columns.include?(attr_name)
      self.send("#{attr_name}=", value)
      # debugger
    end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
