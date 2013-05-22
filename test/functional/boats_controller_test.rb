require 'test_helper'

class BoatsControllerTest < ActionController::TestCase
  setup do
    @boat = boats(:one)
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
      post :create, boat: { Huomautukset: @boat.Huomautukset, JnoOm: @boat.JnoOm, JnoOs: @boat.JnoOs, Katsastus: @boat.Katsastus, Korkeus: @boat.Korkeus, Laituri: @boat.Laituri, Leveys: @boat.Leveys, MuutosPvm: @boat.MuutosPvm, Nimi: @boat.Nimi, Omistaja: @boat.Omistaja, Pituus: @boat.Pituus, RekNro: @boat.RekNro, RekPvm: @boat.RekPvm, Syvyys: @boat.Syvyys, Tarra: @boat.Tarra, Teho: @boat.Teho, Telakka: @boat.Telakka, Uppouma: @boat.Uppouma, ValmMalli: @boat.ValmMalli, VenePuhA: @boat.VenePuhA, VenePuhB: @boat.VenePuhB, Vuosimalli: @boat.Vuosimalli, tyyppi: @boat.tyyppi }
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
    put :update, id: @boat, boat: { Huomautukset: @boat.Huomautukset, JnoOm: @boat.JnoOm, JnoOs: @boat.JnoOs, Katsastus: @boat.Katsastus, Korkeus: @boat.Korkeus, Laituri: @boat.Laituri, Leveys: @boat.Leveys, MuutosPvm: @boat.MuutosPvm, Nimi: @boat.Nimi, Omistaja: @boat.Omistaja, Pituus: @boat.Pituus, RekNro: @boat.RekNro, RekPvm: @boat.RekPvm, Syvyys: @boat.Syvyys, Tarra: @boat.Tarra, Teho: @boat.Teho, Telakka: @boat.Telakka, Uppouma: @boat.Uppouma, ValmMalli: @boat.ValmMalli, VenePuhA: @boat.VenePuhA, VenePuhB: @boat.VenePuhB, Vuosimalli: @boat.Vuosimalli, tyyppi: @boat.tyyppi }
    assert_redirected_to boat_path(assigns(:boat))
  end

  test "should destroy boat" do
    assert_difference('Boat.count', -1) do
      delete :destroy, id: @boat
    end

    assert_redirected_to boats_path
  end
end
