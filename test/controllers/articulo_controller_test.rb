require 'test_helper'

class ArticuloControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articulo_index_url
    assert_response :success
  end

end
