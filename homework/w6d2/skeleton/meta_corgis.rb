class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }
  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

end


class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def method_missing(name, *args)
    name = name.to_s 
    # need to use #send(name, args) somehow, but none
    # of these instructions make any sense, and
    # the homework reading was ridiculously 
    # incomprehensible.

    # snack_box = SnackBox.new 
    #    so what, this makes a new "database", a
    #     Hash that represents a table like this:

    #  id  |  bone info | bone tastiness | kibble info | kibble tastiness | treat info | treat tastiness
    #   1  |  Phoeni... |    20          | etc..

    # meta_snacks = MetaCorgiSnacks.new(snack_box, 1)
    #    this makes an instance on which one can still call
    #     the #bone #kibble etc. methods but I'm supposed
    #     to write a #method_missing method that parses
    #     the name & arguments in such a way that it can
    #     'plugged in' to some general, flexible structure
    #     of code
    #     it's basically a way to get rid of repeating the
    #     same code three times to get the same behavior
    #     from #bone, #kibble, and #treat.
    #     that's all fine and dandy but I haven't a clue
    #     how to write that code, and if the homework
    #     reading was supposed to teach me, it failed.
    #
    #     Screw this. I've already spent more than twice 
    #     as much time as I'm supposed to on this inanity.

  end


  def self.define_snack(name)
    # Your code goes here...
  end
end
