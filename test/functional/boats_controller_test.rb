require 'test_helper'

class BoatsControllerTest < ActionController::TestCase
  setup do
	sign_in admins(:one)
	@boat = boats(:one)
  @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:boats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create boat" do
    assert_difference('Boat.count') do
      post :create, boat: { Huomautukset: @boat.Huomautukset, JnoOm: @member.Jno, JnoOs: @boat.JnoOs, Katsastus: @boat.Katsastus, Korkeus: @boat.Korkeus, Laituri: @boat.Laituri, Leveys: @boat.Leveys, MuutosPvm: @boat.MuutosPvm, Nimi: @boat.Nimi, Omistaja: @boat.Omistaja, Pituus: @boat.Pituus, RekNro: @boat.RekNro, RekPvm: @boat.RekPvm, Syvyys: @boat.Syvyys, Tarra: @boat.Tarra, Teho: @boat.Teho, Telakka: @boat.Telakka, Uppouma: @boat.Uppouma, ValmMalli: @boat.ValmMalli, VenePuhA: @boat.VenePuhA, VenePuhB: @boat.VenePuhB, Vuosimalli: @boat.Vuosimalli, tyyppi: @boat.tyyppi, BoatsMembers_attributes: {"0" => {member_id: @member.Jno, boat_id: @boat.id}} }
      puts @response.inspect
    end

    assert_redirected_to boat_path(assigns(:boat))
  end

  test "should show boat" do
    get :show, id: @boat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @boat
    assert_response :success
  end

  test "should update boat" do
    put :update, id: @boat, boat: { Huomautukset: @boat.Huomautukset, JnoOm: @member.Jno, JnoOs: @boat.JnoOs, Katsastus: @boat.Katsastus, Korkeus: @boat.Korkeus, Laituri: @boat.Laituri, Leveys: @boat.Leveys, MuutosPvm: @boat.MuutosPvm, Nimi: @boat.Nimi, Omistaja: @boat.Omistaja, Pituus: @boat.Pituus, RekNro: @boat.RekNro, RekPvm: @boat.RekPvm, Syvyys: @boat.Syvyys, Tarra: @boat.Tarra, Teho: @boat.Teho, Telakka: @boat.Telakka, Uppouma: @boat.Uppouma, ValmMalli: @boat.ValmMalli, VenePuhA: @boat.VenePuhA, VenePuhB: @boat.VenePuhB, Vuosimalli: @boat.Vuosimalli, tyyppi: @boat.tyyppi, BoatsMembers_attributes: [{member_id: @member.id, boat_id: @boat.id}] }
    assert_redirected_to boat_path(assigns(:boat))
  end

  test "should destroy boat" do
    assert_difference('Boat.count', -1) do
      delete :destroy, id: @boat
    end

    assert_redirected_to boats_path
  end

  test "should save new boat models to db" do
    #Malli.count is different after creating a new boat -> there must be new entry in mallis table!
    assert_difference('Malli.count') do
      post :create, boat: { :Omistaja => "ommm", :RekPvm => "1.5.1000", :Nimi => "nimi", :tyyppi => "type-a", :RekNro => 'aaaa', :ValmMalli => 'type-a', :Pituus => 10, :Leveys => 10, :Syvyys => 10, :Vuosimalli => 1999 }
    end
  end

end
