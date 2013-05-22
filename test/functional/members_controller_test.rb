require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, member: { Ammatti: @member.Ammatti, Avain: @member.Avain, EmailFax: @member.EmailFax, Huom: @member.Huom, JK: @member.JK, Jno: @member.Jno, KotiPuh: @member.KotiPuh, Laivuri: @member.Laivuri, Liittynyt: @member.Liittynyt, Lisenssi: @member.Lisenssi, Maa: @member.Maa, MatkaPuh: @member.MatkaPuh, MuutosPvm: @member.MuutosPvm, Nimi: @member.Nimi, Osoite: @member.Osoite, Posti: @member.Posti, Sotu: @member.Sotu, Toimi: @member.Toimi, TyoPuh: @member.TyoPuh, Varasto: @member.Varasto }
    end

    assert_redirected_to member_path(assigns(:member))
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member
    assert_response :success
  end

  test "should update member" do
    put :update, id: @member, member: { Ammatti: @member.Ammatti, Avain: @member.Avain, EmailFax: @member.EmailFax, Huom: @member.Huom, JK: @member.JK, Jno: @member.Jno, KotiPuh: @member.KotiPuh, Laivuri: @member.Laivuri, Liittynyt: @member.Liittynyt, Lisenssi: @member.Lisenssi, Maa: @member.Maa, MatkaPuh: @member.MatkaPuh, MuutosPvm: @member.MuutosPvm, Nimi: @member.Nimi, Osoite: @member.Osoite, Posti: @member.Posti, Sotu: @member.Sotu, Toimi: @member.Toimi, TyoPuh: @member.TyoPuh, Varasto: @member.Varasto }
    assert_redirected_to member_path(assigns(:member))
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end
end
