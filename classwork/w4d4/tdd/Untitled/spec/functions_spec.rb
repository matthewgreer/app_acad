require "functions"
require "rspec"

describe "Array" do
  describe "#my_uniq" do
    it "returns an array" do
      expect([1, 2, 3].my_uniq).to be_a(Array)
    end

    it "returns array of unique elements" do
      expect([1, 2, 3, 3, 2].my_uniq).to eq([1, 2, 3])
    end
  end

  describe "#to_sum" do
    it "returns an array" do
      expect([1, 2, 3].to_sum).to be_a(Array)
    end

    it "returns an array with each element as an array of length two" do
      expect(
        [-1, 0, 2, -2, 1].to_sum.any? { |el| el.length != 2 && el.class != Array }
      ).to be(false)
    end

    it "returns pairs of indices whose elements sum to zero" do
      expect([-1, 0, 2, -2, 1].to_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "#my_transpose" do
  let(:rows) {
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
    ]
  }
  let(:results) {
    [[0, 3, 6],
     [1, 4, 7],
     [2, 5, 8]]
  }
  it "returns an array" do
    expect(my_transpose(rows)).to be_a(Array)
  end

  it "returns matrix with rows and columns reversed" do
    expect(my_transpose(rows)).to eq(results)
  end
end

describe "#stock_picker" do
  let(:prices) { [100, 50, 6, 25, 15, 60] }
  it "takes array as argument" do
    expect { stock_picker([1, 2, 3]) }.not_to raise_error
  end

  it "should only take array as argument" do
    expect { stock_picker("bad input") }.to raise_error(ArgumentError)
  end

  it "should output an array with a pair of indices" do
    expect(stock_picker(prices).length).to eq(2)
    expect(stock_picker(prices)).to eq([2, 5])
  end
end

describe "TowersOfHanoi" do
  # expect(object).to receive(:message).with(1, 2, any_args)
  subject(:tower) { TowersOfHanoi.new(3) }
  describe "#initialize" do
    it "takes in a number of pieces" do
      tower = TowersOfHanoi.new(num_pieces = 3)
      expect(tower.class).to eq(TowersOfHanoi)
    end

    it "starts with n pieces" do
      expect(tower.pieces).to eq(3)
    end

    it "starts with left tower of size n, middle and left towers empty" do
      expect(tower.left).to eq([1, 2, 3])
      expect(tower.middle).to eq([])
      expect(tower.right).to eq([])
    end
  end

  describe "#run" do
    it "calls #move" do
      tower.instance_variable_set(:@left, [1])
      tower.instance_variable_set(:@middle, [])
      tower.instance_variable_set(:@right, [2, 3])
      expect(tower).to receive(:move).with(:@left, :@right)
      tower.run
    end

    it "calls #won?" do
      tower.instance_variable_set(:@left, [1])
      tower.instance_variable_set(:@middle, [])
      tower.instance_variable_set(:@right, [2, 3])
      expect(tower).to receive(:won?)
      tower.run
    end
  end

  describe "#move" do
    it "moves one piece to another tower" do
      tower.move(tower.left, tower.middle)
      expect(tower.middle).to eq([1])
    end

    it "returns false if player tries to move a larger piece onto a smaller one" do
      expect(tower.move(tower.left, tower.middle)).to be(true)
      expect(tower.move(tower.left, tower.middle)).to be(false)
    end
  end

  describe "#won?" do
    it "returns true if the right tower has all pieces in ascending order" do
      tower.instance_variable_set(:@right, [1, 2, 3])
      tower.instance_variable_set(:@left, [])
      tower.instance_variable_set(:@middle, [])
      expect(tower.won?).to be(true)
    end
    it "returns false if otherwise" do
      tower.instance_variable_set(:@left, [1, 2, 3])
      expect(tower.won?).to be(false)
    end
  end
end

# describe "#create_#{class_to_instantiate}" do
#     it "returns #{class_to_instantiate} with default values when called with no parameters" do
#       instance = create_instance()

#       expect(instance.class).to eq(class_to_instantiate)
#       expect(instance.name).to eq(defaults[:name])
#       expect(instance.filename).to eq(defaults[:filename])
#       expect(instance.website).to eq(defaults[:website])
#     end

#     "returns TowersOfHanoi with number of pieces"

# it "returns #{class_to_instantiate} with custom name when specified" do
#       instance = create_instance(name: 'New Name')
#       tower = Tower.new(num_pieces = 3)

#       expect(instance.class).to eq(class_to_instantiate)
#       expect(instance.name).to eq('New Name')
#       expect(instance.filename).to eq(defaults[:filename])
#       expect(instance.website).to eq(defaults[:website])
