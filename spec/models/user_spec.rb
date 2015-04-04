require 'rails_helper'

RSpec.describe User, type: :model do
  require 'rails_helper'

  describe "users/new.html.erb", type: :view do

    describe 'being able to login as an admin or a regular user' do

      before :each do
        @admin=double(User, :userid => "anne", :admin => true, :password_digest => "abc")
        @user=double(User, :userid => "taylor", :admin => false, :password_digest => "123")
      end

      # rest of this still needs to be edited, only the descriptions (.e.g it ... do are somewhat done)

      it 'should login an admin correctly' do
        User.should_receive(:find_by_userid).with('anne').and_return(@admin)
      end

      it 'should login a user correctly' do
        User.should_receive(:find_by_userid).with('taylor').and_return(@user)
      end

    end


  end

end
