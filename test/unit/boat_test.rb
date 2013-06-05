#encoding: utf-8

require 'test_helper'

class BoatTest < ActiveSupport::TestCase
  #Almost same as member_test.rb

  test "test boat versioning" do
    @boat = boats(:one)

    assert @boat.version == 1, "@boat.version should be 1"
    assert @boat.ValmMalli == "MyString", "@boat.ValmMalli should be MyString"

    @boat.update_attribute(:ValmMalli, "Mauri")

    assert @boat.version == 2, "@boat.version should be 2"
    assert @boat.ValmMalli == "Mauri", "@boat.ValmMalli should be Mauri"

    @boat.revert_to(@boat.version-1)

    assert @boat.version == 1, "@boat.version should be 1 again"
    assert @boat.ValmMalli == "MyString", "@boat.ValmMalli should be MyString again"

  end

  test "does not create a boat without information" do
  
  boat = Boat.new
  assert !boat.save, "Creates a new boat without information"
  end

  test "works with correct inputs" do
  @member = members(:one)
  boat = Boat.new
  boat.Omistaja = "Karl Segelbåt"
  boat.RekPvm = "2012-09-10"
  boat.Nimi = "Virgin of the Maries"
  boat.tyyppi = "Segelbåt"
  boat.RekNro = "T1t4n1c"
  boat.ValmMalli = "Busteri"
  boat.Pituus = "5.7"
  boat.Leveys = "2.5"
  boat.Syvyys = "0.8"
  boat.Korkeus = "2.0"
  boat.Vuosimalli = "2009"
  boat.JnoOm = @member.Jno
  assert boat.save, "Creates a new boat with all needed information"
  end

  test "Year can only be an integer" do

  boat = Boat.new
  boat.Omistaja = "Karl Segelbåt"
  boat.RekPvm = "2012-09-10"
  boat.Nimi = "Virgin of the Maries"
  boat.tyyppi = "Segelbåt"
  boat.RekNro = "T1t4n1c"
  boat.ValmMalli = "Busteri"
  boat.Pituus = "5.7"
  boat.Leveys = "2.5"
  boat.Syvyys = "0.8"
  boat.Korkeus = "2.0"
  boat.Vuosimalli = "kivi"
  assert !boat.save, "Creates a new boat with incorrect year input"
  end

  test "Length, Width, Depth and Height can only be numbers seperated with a dot" do

  boat = Boat.new
  boat.Omistaja = "Karl Segelbåt"
  boat.RekPvm = "2012-09-10"
  boat.Nimi = "Virgin of the Maries"
  boat.tyyppi = "Segelbåt"
  boat.RekNro = "T1t4n1c"
  boat.ValmMalli = "Busteri"
  boat.Pituus = "long"
  boat.Leveys = "wide"
  boat.Syvyys = "deep"
  boat.Korkeus = "high"
  boat.Vuosimalli = "2009"
  assert !boat.save, "Creates a new boat with incorrect inputs in decimal fields"
  end
end
