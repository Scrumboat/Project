#encoding: utf-8

require 'test_helper'

class BoatTest < ActiveSupport::TestCase
  #Almost same as member_test.rb

  test "test boat versioning" do
    @boat = boats(:one)

    assert @boat.version == 1, "@boat.version should be 1"
    assert @boat.valm_malli == "MyString", "@boat.valm_malli should be MyString"

    @boat.update_attribute(:valm_malli, "Mauri")

    assert @boat.version == 2, "@boat.version should be 2"
    assert @boat.valm_malli == "Mauri", "@boat.valm_malli should be Mauri"

    @boat.revert_to(@boat.version-1)

    assert @boat.version == 1, "@boat.version should be 1 again"
    assert @boat.valm_malli == "MyString", "@boat.valm_malli should be MyString again"

  end

  test "does not create a boat without information" do
  
  boat = Boat.new
  assert !boat.save, "Creates a new boat without information"
  end

  test "works with correct inputs" do
  @member = members(:one)
  boat = Boat.new
  boat.rek_pvm = "2012-09-10"
  boat.nimi = "Virgin of the Maries"
  boat.tyyppi = "Segelbåt"
  boat.reknro = "T1t4n1c"
  boat.valm_malli = "Busteri"
  boat.pituus = "5.7"
  boat.leveys = "2.5"
  boat.syvyys = "0.8"
  boat.korkeus = "2.0"
  boat.vuosimalli = "2009"
  assert boat.save, "Creates a new boat with all needed information"
  end

  test "Year can only be an integer" do

  boat = Boat.new
  boat.rek_pvm = "2012-09-10"
  boat.nimi = "Virgin of the Maries"
  boat.tyyppi = "Segelbåt"
  boat.reknro = "T1t4n1c"
  boat.valm_malli = "Busteri"
  boat.pituus = "5.7"
  boat.leveys = "2.5"
  boat.syvyys = "0.8"
  boat.korkeus = "2.0"
  boat.vuosimalli = "kivi"
  assert !boat.save, "Creates a new boat with incorrect year input"
  end

  test "Length, Width, Depth and Height can only be numbers seperated with a dot" do

  boat = Boat.new
  boat.rek_pvm = "2012-09-10"
  boat.nimi = "Virgin of the Maries"
  boat.tyyppi = "Segelbåt"
  boat.reknro = "T1t4n1c"
  boat.valm_malli = "Busteri"
  boat.pituus = "long"
  boat.leveys = "wide"
  boat.syvyys = "deep"
  boat.korkeus = "high"
  boat.vuosimalli = "2009"
  assert !boat.save, "Creates a new boat with incorrect inputs in decimal fields"
  end
end
