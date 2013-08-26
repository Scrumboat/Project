require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    sign_in admins(:one)
    @member = members(:one)
  end

  teardown do
    @member = nil
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
      post :create, member: { ammatti: @member.ammatti, avain: @member.avain, email_fax: @member.email_fax, huom: @member.huom, jasentyyppi: @member.jasentyyppi, jno: @member.jno+5, koti_puh: @member.koti_puh, laivuri: @member.laivuri, liittynyt: @member.liittynyt, lisenssi: @member.lisenssi, maa: @member.maa, matka_puh: @member.matka_puh, muutos_pvm: @member.muutos_pvm, nimi: @member.nimi, osoite: @member.osoite, posti: @member.posti, sotu: @member.sotu, tyo_puh: @member.tyo_puh, varasto: @member.varasto }
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
    put :update, id: @member, member: { ammatti: @member.ammatti, avain: @member.avain, email_fax: @member.email_fax, huom: @member.huom, jasentyyppi: @member.jasentyyppi, jno: @member.jno, koti_puh: @member.koti_puh, laivuri: @member.laivuri, liittynyt: @member.liittynyt, lisenssi: @member.lisenssi, maa: @member.maa, matka_puh: @member.matka_puh, muutos_pvm: @member.muutos_pvm, nimi: @member.nimi, osoite: @member.osoite, posti: @member.posti, sotu: @member.sotu, toimi: @member.toimi, tyo_puh: @member.tyo_puh, varasto: @member.varasto }
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

  test "deleted field is true when :destroy" do
    #member.deleted should be false
    assert !@member.deleted, "member.deleted should be false"
    #now we delete it
    put :destroy, id: @member
    
    #now fetch it from db ( dunno why it doesn't update @member :O )
    member = Member.find(@member.id)
    #member.deleted should be true
    assert member.deleted, "member.deleted should be true"
  end
end
