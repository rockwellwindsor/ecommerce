require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
    assert_select '.columns #side a', minimum: 3
    assert_select '.content .entry', minimum: 2
    assert_select 'h3', 'Product 1'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end

end
