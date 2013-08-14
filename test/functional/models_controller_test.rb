 require 'test_helper.rb'
 
  class ModelsControllerTest < ActionController::TestCase
    setup do
      sign_in admins(:one)
      assert Model.create(:korkeus => 10 ,:tyyppi => "typea", :uppouma => 10, :valm_malli => "typea", :pituus => 10, :leveys => 10, :syvyys => 10)
    end
 
    def json_response
      ActiveSupport::JSON.decode @response.body
    end
 
    test "should get json reply" do
      get :show, {:id => "typea", :format => :json}
      assert @response.header['Content-Type'].include?('application/json'), "content-type fail"
      assert_equal "typea", json_response['tyyppi']
      assert_equal "typea", json_response['valm_malli']
      assert_in_delta 10, json_response['leveys'].to_f, 0.0001
      assert_in_delta 10, json_response['korkeus'].to_f, 0.0001
      assert_in_delta 10, json_response['pituus'].to_f, 0.0001
      assert_in_delta 10, json_response['syvyys'].to_f, 0.0001
      assert_in_delta 10, json_response['uppouma'].to_f, 0.0001
    end
  end
