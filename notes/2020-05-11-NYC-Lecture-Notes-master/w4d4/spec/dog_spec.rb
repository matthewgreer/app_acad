require "dog" # rspec knows to look in the lib folder for the dog.rb file
# require "cat"

describe Dog do # `describe` organizes our test code
    subject(:milo) { Dog.new("Milo") } # this subject is accessible across all `it` blocks (created anew for each test)
        # there should only be a single subject per file (this is the primary test subject)
    
    it "initializes" do # `it` block contains an individual spec
        # milo = Dog.new("Milo") # this local variable is restricted to the scope of the `it`
        expect(milo).to be_a(Dog)   # `expect` performs the actual test; matches the outputted value to expected value
    end

    it "has a name" do
        # milo = Dog.new("Milo")
        expect(milo.name).to eq("Milo") # checks equality of contents
        # expect(milo.name).to be("Milo") # checks object identity
    end

    it "can be renamed" do
        milo.name = "Charlie" # make the reassignment first
        expect(milo.name).to eq("Charlie") # then check whether the value has changed (i.e., has the setter method correctly set the value)
    end

    describe "#encounter_cat" do
        # context == alias for describe, but more semantic for describing different scenarios or outcomes

        let(:cat) { double("Cat") } # creates a secondary object for testing, stored in variable `cat`
            # can have multiple `let`s in a spec file

        context "when the cat is not friendly" do
            it "should run away" do
                # cat = Cat.new(true) 
                    # this introduces a new class into the mix, which can muddle the results for the Dog class
                    # we don't want bugs in our Cat code to affect the Dog tests
                    # for unit tests (which test classes in isolation), use doubles!

                # cat = double("Cat", is_friendly?: false) # creates a mock Cat object 
                    # the double is not an instance of the Cat class; it has no connection to the actual Cat class
                    # the second arg is a hash that lets us mimic the behavior that the test subject (Dog instance) needs access to
                    # ensures `is_friendly?` will return false

                allow(cat).to receive(:is_friendly?).and_return(false) 
                    # mimic an unfriendly cat
                    # allow `is_friendly?` to be called on the mock cat 
                    # (which should happen when we call encounter_cat)
                    # specify that it will return false (hardcoding the response)

                # milo.encounter_cat(cat) # will this work? -> no
                expect(milo).to receive(:run_away) # this informs the test that it needs to wait for :run_away to be called on milo
                milo.encounter_cat(cat) # this triggers the operation that the `expect` is looking for
                
            end
        end

        context "when the cat is friendly" do
            it "should play" do
                # cat = double("Cat", is_friendly?: true)
                allow(cat).to receive(:is_friendly?).and_return(true) # mimic a friendly cat
                # expect(milo).to receive(:play)
                # milo.encounter_cat(cat)
                expect { milo.encounter_cat(cat) }.to raise_error(ImpossibleCat)
                    # when we set an expectation that an error should be raised, the code to be tested should be wrapped in a block (this allows the error to be rescued)
            end
        end
    end
end