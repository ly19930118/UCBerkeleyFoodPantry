require 'rails_helper'

RSpec.describe "users/new.html.erb", type: :view do

  describe 'find similar director walkthrough' do
    before :each do
      @movie=double(Movie, :title => "Pee Wee", :director => "Sherman", :id => "1")
      Movie.stub(:find).with("1").and_return(@movie)
    end

    it '#3 should have restful routing for similar movies' do
      { :post => movie_director_path(1) }.
          should route_to(:controller => "movies", :action => "director", :movie_id => "1")
    end

    it '#1 should call the model method to find similar movies' do
      someMovies = [double(Movie, :title => "Pee Wee Two", :director => "Sherman", :id => "2"), double(Movie, :title => "Pee Wee Three", :director => "Sherman", :id => "3")]
      Movie.should_receive(:same_directors).with('Sherman').and_return(someMovies)
      get :director, :movie_id => "1"
    end

    it '#2 should receive click with controller method and grab id' do
      Movie.stub(:same_directors).with('Sherman').and_return(@movie)
      get :director, :movie_id => "1"
      response.should render_template('director')
      assigns(:movies).should == @movie
    end

  end


end
