 require 'test_helper.rb'
 
  class MallisControllerTest < ActionController::TestCase
    setup do
      assert Malli.create(:Korkeus => 10 ,:tyyppi => "typea", :Uppouma => 10, :ValmMalli => "typea", :Pituus => 10, :Leveys => 10, :Syvyys => 10)
    end
 
    def json_response
      ActiveSupport::JSON.decode @response.body
    end
 
    test "should get json reply" do
      get :show, {:id => "typea", :format => :json}
      assert @response.header['Content-Type'].include?('application/json'), "content-type fail"
      assert_equal "typea", json_response['tyyppi']
      assert_equal "typea", json_response['ValmMalli']
      assert_in_delta 10, json_response['Leveys'].to_f, 0.0001
      assert_in_delta 10, json_response['Korkeus'].to_f, 0.0001
      assert_in_delta 10, json_response['Pituus'].to_f, 0.0001
      assert_in_delta 10, json_response['Syvyys'].to_f, 0.0001
      assert_in_delta 10, json_response['Uppouma'].to_f, 0.0001
    end
  end
