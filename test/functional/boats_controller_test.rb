require 'test_helper'

class BoatsControllerTest < ActionController::TestCase
  setup do
	sign_in admins(:one)
	@boat = boats(:one)
  @boat2 = boats(:two)
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
    put :update, id: @boat, boat: { huomautukset: @boat.huomautukset, katsastus: @boat.katsastus, korkeus: @boat.korkeus, leveys: @boat.leveys, muutos_pvm: @boat.muutos_pvm, nimi: @boat.nimi, pituus: @boat.pituus, reknro: @boat.reknro, rek_pvm: @boat.rek_pvm, syvyys: @boat.syvyys, tarra: @boat.tarra, teho: @boat.teho, uppouma: @boat.uppouma, valm_malli: @boat.valm_malli, vene_puh_a: @boat.vene_puh_a, vene_puh_b: @boat.vene_puh_b, vuosimalli: @boat.vuosimalli, tyyppi: @boat.tyyppi, BoatsMembers_attributes: {"0" => {member_id: @member.jno, boat_id: @boat.id, paying_member: '1'}} }
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
      post :create, boat: { huomautukset: @boat2.huomautukset, katsastus: @boat2.katsastus, korkeus: @boat2.korkeus, leveys: @boat2.leveys, muutos_pvm: @boat2.muutos_pvm, nimi: @boat2.nimi, pituus: @boat2.pituus, reknro: @boat2.reknro, rek_pvm: @boat2.rek_pvm, syvyys: @boat2.syvyys, tarra: @boat2.tarra, teho: @boat2.teho, uppouma: @boat2.uppouma, valm_malli: @boat2.valm_malli, vene_puh_a: @boat2.vene_puh_a, vene_puh_b: @boat2.vene_puh_b, vuosimalli: @boat2.vuosimalli, tyyppi: @boat2.tyyppi, BoatsMembers_attributes: {"1" => {member_id: @member.jno, boat_id: @boat2.id}} }
    end
  end

end
