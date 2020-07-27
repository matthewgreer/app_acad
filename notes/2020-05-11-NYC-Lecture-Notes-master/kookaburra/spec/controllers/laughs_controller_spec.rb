require "rails_helper"

# What to test in controller?
    # finishes the response with render or redirect
    # creates / updates / destroys the entity in the DB
    # ensure user is logged in before accessing certain actions (e.g., if there's a `before_action` requiring user to be logged in before creating a laugh)


RSpec.describe LaughsController, type: :controller do
    describe "get#index" do
        it "renders the laughs#index" do
            get :index  # simulate an http request (needed to test the controller action)
                        # http verb - controller action
            # debugger
            expect(response).to render_template(:index) # `response` is built-in, gives us access to our response object
        end
    end

    describe "get#new" do
        it "renders form to make a new laugh" do
            allow(subject).to receive(:logged_in?).and_return(true) # `subject` is built-in, gives us access to test subject
            # debugger
            get :new
            expect(response).to render_template(:new)
        end
    end

    describe "delete#destroy" do 
        let!(:test_laugh) { create(:laugh) }
        before :each do
            allow(subject).to receive(:current_user).and_return(test_laugh.author)
            delete :destroy, params: { id: test_laugh.id }
        end

        it "destroys the laugh" do
            expect(Laugh.exists?(test_laugh.id)).to be(false)
        end

        it "redirects to laughs_url" do
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(laughs_url)
        end
    end

    describe "post#create" do
        # 1. check if user is logged in
        # 2. need fake params: valid and invalid
        # 3. need to check response to valid and invalid params
        # 4. check appropriate render or redirect
        # 5. check if laugh was created

        before :each do
            create :user
            allow(subject).to receive(:current_user).and_return(User.last)
            # allow(subject).to receive(:logged_in?).and_return(true) # doesn't work b/c our laughs#create controller action uses the `current_user` to create a laugh associated with that user
        end

        let(:valid_params) { 
            { laugh: {
                body: "hey programmers",
                author_id: User.last.id
                }    
            }
        }

        let(:invalid_params) { 
            { laugh: {
                banana: "wrong params",
                author_id: User.last.id
                }    
            }
        }

        context "with valid params" do

            before :each do
                post :create, params: valid_params # simulate the http request
            end
            
            it "creates the laugh" do
                # post :create, params: valid_params # simulate the http request
                expect(Laugh.exists?(Laugh.last.id)).to be(true)
            end

            it "redirects to laugh_url" do # after successful creation
                # post :create, params: valid_params # remake the request (each `it` block is separate)
                # expect(response).to have_http_status(302)
                # debugger
                expect(response).to redirect_to(laugh_url(Laugh.last.id))
            end
        end

        context "with invalid params" do
            before :each do
                post :create, params: invalid_params
            end

            it "renders new_laugh_url" do
                expect(response).to have_http_status(422)
                expect(response).to render_template(:new)
            end

            it "add errors to flash" do
                expect(flash[:errors]).to be_present
            end
        end
    end

end