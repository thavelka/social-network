require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "a user should enter a first name" do
    user = User.new
    assert !user.save 
    assert !user.errors[:first_name].empty?
  end
  
  test "a user should enter a last name" do
    user = User.new
    assert !user.save 
    assert !user.errors[:last_name].empty?
  end
  
  test "a user should enter a profile name" do
    user = User.new
    assert !user.save 
    assert !user.errors[:profile_name].empty?
  end
  
  test "a user should enter a unique profile name" do
    user = User.new
    user.profile_name = users(:tim).profile_name
    assert !user.save 
    puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
  end
  
  test "a user should enter a valid profile name" do
    user = User.new
    user.profile_name = "name with spaces"
    assert !user.save 
    puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly")
  end
  
end