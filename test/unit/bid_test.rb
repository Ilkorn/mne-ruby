require 'test_helper'

class BidTest < ActiveSupport::TestCase
  test "Get person Bids" do
      user = User.where(:first_name => 'Andrei').first
      assert_not_nil(user, 'Problem in User model')
      assert user.lots.size > 0
      f = user.last_name.to_s
      p "User #{f} has #{user.lots.size} lot"
  end

  test "Basic CRUD operations" do
      NEW_USER_NAME = "Moka"
      user = User.last
      assert_not_equal(user.first_name, NEW_USER_NAME)
      assert(!user.first_name.to_s.empty?)

      user.first_name = NEW_USER_NAME
      user.save
      expectedUser = User.where(:first_name => NEW_USER_NAME).first
      assert_not_nil(expectedUser)

      userID = expectedUser.id
      expectedUser.destroy
      assert(expectedUser.destroyed?, "destruction failed")

      newbeUser = User.new
      NEWBE_NAME = "Perfecto"
      newbeUser.first_name = NEWBE_NAME
      newbeUser.email = "aa@bb.cc"
      newbeUser.password = "12345678"
      puts newbeUser.inspect
      puts "USER VALID = #{newbeUser.valid?}"
      newbeUser.invalid?
      if newbeUser.save!
        puts "###SAVED###"
      end
      expectedUser = User.where(:first_name => NEWBE_NAME).first
      assert_not_nil(expectedUser)
  end

  test "Work with sub structure" do
      currect_user = User.where(:first_name => 'This for').first
      assert_not_nil(currect_user)
      p currect_user.inspect

      list_if_bids = currect_user.bids.all
      assert(currect_user.bids.size > 0)
      p "User has #{currect_user.bids.size} dibs"

      bidEntity = currect_user.bids.first
      assert_not_nil(bidEntity)
      p "# one of bids current user: #{bidEntity.inspect}"

      lot = currect_user.lots.first
      assert_not_nil(lot)
      p "# one of lot current user: #{lot.inspect}"

      bidBelongToLot = bidEntity.lot
      p "# lot on that user put bid: #{bidBelongToLot.inspect}"
      assert_not_nil(bidBelongToLot)

      lotOwner = bidBelongToLot.user
      p "# owner of bided lot: #{lotOwner.inspect}"
      assert_not_nil(lotOwner)

      assert_not_equal(lotOwner.first_name, currect_user.first_name)
      p "user1 = #{lotOwner.first_name}; user2 = #{currect_user.first_name}"

  end

end
