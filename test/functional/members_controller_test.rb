require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
	sign_in admins(:one)
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

  test "member doesnt get removed when deleted from show list" do
    #should be no difference, because destroying only set deleted = true
    assert_difference('Member.count', 0) do
      delete :destroy, id: @member
    end

    assert_redirected_to members_path
  end

  test "should not be able to remove member when boat associated" do
  @boat = boats(:one)
  @boats_member = BoatsMember.create(:boat_id => @boat.id, :member_id => @member.id)
  
  #Let's try to remove @member. should be redirected to /members/id (which shows cannot delete message)
  put :destroy, id: @member
  assert_redirected_to member_path
  
  #Now, let's remove association with the boat and member and try again. (we should go to /members now)
  @boats_member.destroy

  put :destroy, id: @member
  assert_redirected_to members_path
  end
end
