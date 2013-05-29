require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  
  test "versioning works" do
    #Load member from fixture
    @member = members(:one)
    
    #Check that name equals the one set in fixture
    assert @member.Nimi.eql? "MyString"
    
    #Check that version is correct
    assert @member.version == 1

    #Change few attributes and check that everything has changed accordingly
    @member.update_attributes(:Nimi => "Mauri", :Jno => 14444)
    assert @member.Nimi == "Mauri"
    assert (@member.version == 2)
    assert @member.Jno == 14444

    #revert to previous version, the one before mauri and 14444
    @member.revert_to(@member.version-1)

    #Check that we have the original data
    assert @member.Nimi == "MyString"
    assert @member.Jno == 1
    assert @member.version == 1

  end
end
