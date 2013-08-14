#encoding: utf-8

require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  
  test "versioning works" do
    #Load member from fixture
    @member = members(:one)
    
    #Check that name equals the one set in fixture
    assert (@member.nimi.eql? "MyString"), 'nimi is correct.'
    
    #Check that version is correct
    assert @member.version == 1

    #Change few attributes and check that everything has changed accordingly
    @member.update_attributes(:nimi => "Mauri", :jno => 14444)
    assert @member.nimi == "Mauri", 'nimi is correct after change'
    assert (@member.version == 2), 'Version number is 2'
    assert @member.jno == 14444, 'jno is 1444'

    #revert to previous version, the one before mauri and 14444
    @member.revert_to(@member.version-1)

    #Check that we have the original data
    assert @member.nimi == "MyString", 'nimi is MyString again'
    assert @member.jno == 12, 'jno is 1 again'
    assert @member.version == 1, 'Version is reverted back to 1'

  end
  test "does not create a member without information" do
  
  membr = Member.new
  assert !membr.save, "Creates a new member without information"
  end

  test "works with correct inputs" do

  membr = Member.new
  membr.nimi = "Karl Segelbåt"
  membr.jno = "13"
  membr.sotu = "123456-7890"
  membr.liittynyt = "2012-09-12"
  membr.jasentyyppi = "ainaisjasen"
  membr.osoite = "Måtårbåtsvägen 10"
  membr.posti = "Måtårbåtsvägen 10"
  membr.matka_puh = "000-123456"
  assert membr.save, "Creates a new member with all needed information"
  end

  test "allows only numbers in jno" do

  membr = Member.new
  membr.nimi = "Karl Segelbåt"
  membr.jno = "2th1s is not concidered a numb3r even though there are som3"
  membr.sotu = "123456-7890"
  membr.liittynyt = "2012-09-12"
  membr.jasentyyppi = "ainaisjasen"
  membr.osoite = "Måtårbåtsvägen 10"
  membr.posti = "Måtårbåtsvägen 10"
  membr.matka_puh = "000-123456"
  assert !membr.save, "Creates a new member with wrong jno input"
  end

  test "Does not allow numbers in a name" do

  membr = Member.new
  membr.nimi = "Karl Segelbåt the 3rd"
  membr.jno = "14"
  membr.sotu = "123456-7890"
  membr.liittynyt = "2012-09-12"
  membr.jasentyyppi = "ainaisjasen"
  membr.osoite = "Måtårbåtsvägen 10"
  membr.posti = "Måtårbåtsvägen 10"
  membr.matka_puh = "000-123456"
  assert !membr.save, "Creates a new member with numbers in name field"
  end
end
