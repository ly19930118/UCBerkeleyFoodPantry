require_relative '../rails_helper'

RSpec.describe User, type: :model do

  describe "users/new.html.erb", type: :view do

    describe 'being able to login as an admin or a regular user' do

      before :each do
        @admin=double(User, :userid => "anne", :admin => true, :password_digest => "abc")
        @user=double(User, :userid => "taylor", :admin => false, :password_digest => "123")
        @nouserid = double(User, :admin => false, :password_digest => 'poophole')
        @nopassword = double(User, :userid => "user123123", :admin => false)
        @shortpassword = double(User, :userid => "user123123", :admin => false, :password => "123", :password_digest => "123124")
      end
      it 'has a valid factory' do
        expect(FactoryGirl.create(:user)).to be_valid
      end
      # rest of this still needs to be edited, only the descriptions (.e.g it ... do are somewhat done)
      it 'is invalid without a userid' do
        expect(FactoryGirl.build(:user, userid: nil)).not_to be_valid
      end

      it 'is invalid without a password digest' do
        expect(FactoryGirl.build(:user, password_digest: nil)).not_to be_valid
      end

      it 'does not allow passwords shorter than 6 characters' do
        expect(FactoryGirl.build(:user, password: '123')).not_to be_valid
      end

    end


  end

end
