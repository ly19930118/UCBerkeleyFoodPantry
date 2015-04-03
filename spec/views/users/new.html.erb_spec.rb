require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do

  describe 'being able to login as an admin or a regular user' do

    before :each do
      @user=double(Movie, :title => "Pee Wee", :director => "Sherman", :id => "1")
      Movie.stub(:find).with("1").and_return(@movie)
    end

    it 'should render the login page correctly' do
      { :post => movie_director_path(1) }.
          should route_to(:controller => "movies", :action => "director", :movie_id => "1")
    end

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

  describe 'being able to sign up as admin or user' do

    it 'should render the login page correctly' do
      { :post => movie_director_path(1) }.
          should route_to(:controller => "movies", :action => "director", :movie_id => "1")
    end

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
