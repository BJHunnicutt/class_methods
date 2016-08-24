###################################
######  CLASS METHODS & SELF  #####
###################################

#Currently we have been creating classes expect many object to be created from them to utilize their functionality.

#With the help of the keyword 'self', we will have


###################################
######     LEARNING GOALS     #####
###################################

# Review what we've learned about classes so far:
    #Constructor (initialize)
    #Instance Methods
    #Attributes (stored in instance variables)

# Discover new functionality within classes:
    # Class Methods and
    # self


###################################
######      CLASS_REVIEW      #####
###################################

## INSTANCE VARIABLES
#   * There's an @ system in front of the variable name
#   * Allows that variable to be used by all methods within that class
#   * Tend to be attributes of the class (i.e. the adjectives)

# ^^
## ATTRIBUTES

## INSTANCE METHODS
#   * They are the behaviors of the class

# INITIALIZE METHOD
#   * Actions performed everytime you create something new for a class
#   * You do NOT have to have an initialize
    # class User
    #   # You also dont have to set a default in initialize
    #   def initialize
    #     @name
    #   end
    #   def add_username(name)
    #     @name = name
    #   end
    # end
    #
    # user1 = User.new
    # puts user1.methods # .methods shows all methods of the class


# class Order
#   def initialize(subtotal, quantity) # <= instance method
#     @subtotal = subtotal
#     @quantity = quantity
#   end
#
#   def total # <= instance method
#     @subtotal * @quantity
#   end
#
#   def to_money # <= instance method
#     # in the line below, `total` is invoking the instance method above
#     "$" + sprintf("%0.02f", total / 100)
#   end
# end
#
# order = Order.new(1000, 2)
# order.to_money #=> $20.00


###################################
########    CLASS METHODS   #######
########     USING SELF     #######
###################################

# #Class methods are called directly by the class and not by an instance of the class.
#
# class Kitten
#   # Using self makes it so you don't have to create Kitten.new, you can call the class method directly
#   def self.say_meow
#     return "meow"
#   end
#
# end
#
# puts "\n" + Kitten.say_meow
#
# # Example:
# require 'faker'
# puts Faker::Hacker.say_something_smart
#   # Faker = module
#   # Hacker = class
#   # say_something_smart = class method *** that you don't need to create a new instance of to call



###################################
######    LETS TRY IT OUT!    #####
###################################

require 'awesome_print'

class Pawn
  attr_reader :position
  def initialize(position)
    @position = position
  end

  # This is the class method, it starts with self.
  # It is only called on the class directly Pawn.make_row
  def self.make_row(side)
    if side == "white"
      num = 2
    else
      num = 7
    end

    # THis is how you create an object inside the class that it belongs to
    pawns = []
    ("a".."h").each do |letter|
      pawns << self.new("#{letter}#{num}")
    end

    pawns
  end
end

# make one pawn
one_pawn = Pawn.new("A2")
# This will not work! Class methods only work if you call it on the class directly
  # => This would need to be an instance method without self. to work 
one_pawn.make_row("black")

# make a whole row of pawns
pawns = Pawn.make_row("black")

# What is being stored in this local variable pawns?
ap pawns
  # An array of Pawn class objects
# ap pawns[0].position

# WHAT IS THIS DOING!?
ap pawns.shuffle.first.position
  # Taking the array of Pawn class objects, shuffling it, taking the first Pawn, and finding it's position



###################################
######   WHERE IS THIS USED?  #####
###################################
#Class methods are for anything that does not deal with an individual instance of a class


#In Gems, like faker
  # https://github.com/stympy/faker/blob/master/lib/faker/hacker.rb

#When we get into databases, our data will be tied to a class. That class will have some premade class methods for us to use:  .find, .last, .where
#Those class methods allow you to find specific objects of that class based on an specified attributes of that class.
