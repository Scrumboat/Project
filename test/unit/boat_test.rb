require 'test_helper'

class BoatTest < ActiveSupport::TestCase
  #Almost same as member_test.rb

  test "test boat versioning" do
    @boat = boats(:one)

    assert @boat.version == 1
    assert @boat.Omistaja == "MyString"

    @boat.update_attributes(:Omistaja => "Mauri", :JnoOm => "1111")

    assert @boat.version == 2
    assert @boat.Omistaja == "Mauri"
    assert @boat.JnoOm == "1111"

    @boat.revert_to(@boat.version-1)

    assert @boat.version == 1
    assert @boat.Omistaja == "MyString"
    assert @boat.JnoOm == "MyString"

  end
end
