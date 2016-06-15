require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success

    assert_select 'table' do
    	assert_select 'tr', 3
    end

    ['Revenues', 'Net income'].each do |th|
	    assert_select 'th', th
    end

    ['Rosneft', '1,000', '100', 'Gazprom', '2,000', '200'].each do |td|
	    assert_select 'td', td
    end

    assert_select 'a', 'Add'
  end

end
