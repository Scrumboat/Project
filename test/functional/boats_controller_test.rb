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
      post :create, boat: { huomautukset: @boat.huomautukset, katsastus: @boat.katsastus, korkeus: @boat.korkeus, leveys: @boat.leveys, muutos_pvm: @boat.muutos_pvm, nimi: @boat.nimi, pituus: @boat.pituus, reknro: @boat.reknro, rek_pvm: @boat.rek_pvm, syvyys: @boat.syvyys, tarra: @boat.tarra, teho: @boat.teho, uppouma: @boat.uppouma, valm_malli: @boat.valm_malli, vene_puh_a: @boat.vene_puh_a, vene_puh_b: @boat.vene_puh_b, vuosimalli: @boat.vuosimalli, tyyppi: @boat.tyyppi, BoatsMembers_attributes: {"0" => {member_id: @member.jno, boat_id: @boat.id}} }
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
    put :update, id: @boat, boat: { huomautukset: @boat.huomautukset, katsastus: @boat.katsastus, korkeus: @boat.korkeus, leveys: @boat.leveys, muutos_pvm: @boat.muutos_pvm, nimi: @boat.nimi, pituus: @boat.pituus, reknro: @boat.reknro, rek_pvm: @boat.rek_pvm, syvyys: @boat.syvyys, tarra: @boat.tarra, teho: @boat.teho, uppouma: @boat.uppouma, valm_malli: @boat.valm_malli, vene_puh_a: @boat.vene_puh_a, vene_puh_b: @boat.vene_puh_b, vuosimalli: @boat.vuosimalli, tyyppi: @boat.tyyppi, BoatsMembers_attributes: {"0" => {member_id: @member.jno, boat_id: @boat.id}} }
    assert_redirected_to boat_path(assigns(:boat))
  end

  test "should destroy boat" do
    assert_difference('Boat.count', -1) do
      delete :destroy, id: @boat
    end

    assert_redirected_to boats_path
  end

  test "should save new boat models to db" do
    #Model.count is different after creating a new boat -> there must be new entry in models table!
    assert_difference('Model.count') do
      post :create, boat: { :rek_pvm => "1.5.1000", :nimi => "nimi", :tyyppi => "type-a", :reknro => 'aaaa', :valm_malli => 'type-a', :pituus => 10, :leveys => 10, :syvyys => 10, :vuosimalli => 1999 }
    end
  end

end
