#encoding: utf-8

require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  
  test "versioning works" do
    #Load member from fixture
    @member = members(:one)
    
    #Check that name equals the one set in fixture
    assert (@member.Nimi.eql? "MyString"), 'Nimi is correct.'
    
    #Check that version is correct
    assert @member.version == 1

    #Change few attributes and check that everything has changed accordingly
    @member.update_attributes(:Nimi => "Mauri", :Jno => 14444)
    assert @member.Nimi == "Mauri", 'Nimi is correct after change'
    assert (@member.version == 2), 'Version number is 2'
    assert @member.Jno == 14444, 'Jno is 1444'

    #revert to previous version, the one before mauri and 14444
    @member.revert_to(@member.version-1)

    #Check that we have the original data
    assert @member.Nimi == "MyString", 'Nimi is MyString again'
    assert @member.Jno == 12, 'Jno is 1 again'
    assert @member.version == 1, 'Version is reverted back to 1'

  end
  test "does not create a member without information" do
  
  membr = Member.new
  assert !membr.save, "Creates a new member without information"
  end

  test "works with correct inputs" do

  membr = Member.new
  membr.Nimi = "Karl Segelbåt"
  membr.Jno = "13"
  membr.Sotu = "123456-7890"
  membr.Liittynyt = "2012-09-12"
  membr.jasentyyppi = "ainaisjasen"
  membr.Osoite = "Måtårbåtsvägen 10"
  membr.Posti = "Måtårbåtsvägen 10"
  membr.MatkaPuh = "000-123456"
  assert membr.save, "Creates a new member with all needed information"
  end

  test "allows only numbers in Jno" do

  membr = Member.new
  membr.Nimi = "Karl Segelbåt"
  membr.Jno = "2th1s is not concidered a numb3r even though there are som3"
  membr.Sotu = "123456-7890"
  membr.Liittynyt = "2012-09-12"
  membr.jasentyyppi = "ainaisjasen"
  membr.Osoite = "Måtårbåtsvägen 10"
  membr.Posti = "Måtårbåtsvägen 10"
  membr.MatkaPuh = "000-123456"
  assert !membr.save, "Creates a new member with wrong Jno input"
  end

  test "Does not allow numbers in a name" do

  membr = Member.new
  membr.Nimi = "Karl Segelbåt the 3rd"
  membr.Jno = "14"
  membr.Sotu = "123456-7890"
  membr.Liittynyt = "2012-09-12"
  membr.jasentyyppi = "ainaisjasen"
  membr.Osoite = "Måtårbåtsvägen 10"
  membr.Posti = "Måtårbåtsvägen 10"
  membr.MatkaPuh = "000-123456"
  assert !membr.save, "Creates a new member with numbers in name field"
  end
end
