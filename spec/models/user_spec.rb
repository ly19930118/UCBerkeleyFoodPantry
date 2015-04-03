require 'rails_helper'

RSpec.describe User, type: :model do
  require 'rails_helper'

  RSpec.describe "users/new.html.erb", type: :view do

    describe 'being able to login as an admin or a regular user' do

      before :each do
        @admin=double(User, :userid => "1", :admin => true, :password_digest => "abc")
        @user=double(User, :userid => "2", :admin => false, :password_digest => "123")
        Movie.stub(:find).with("1").and_return(@admin)
        Movie.stub(:find).with("2").and_return(@user)
      end

      # rest of this still needs to be edited, only the descriptions (.e.g it ... do are somewhat done)

      it 'should find user in database if user account exists' do
        someMovies = [double(Movie, :title => "Pee Wee Two", :director => "Sherman", :id => "2"), double(Movie, :title => "Pee Wee Three", :director => "Sherman", :id => "3")]
        Movie.should_receive(:same_directors).with('Sherman').and_return(someMovies)
        get :director, :movie_id => "1"
      end

      it 'should return error if user does not exist in database' do
        Movie.stub(:same_directors).with('Sherman').and_return(@movie)
        get :director, :movie_id => "1"
        response.should render_template('director')
        assigns(:movies).should == @movie
      end

    end


  end

end
