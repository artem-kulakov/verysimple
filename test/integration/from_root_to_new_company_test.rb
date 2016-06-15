require 'test_helper'

class FromRootToNewCompanyTest < ActionDispatch::IntegrationTest
  
  test 'foo' do
  	# Go to welcome page
  	get root_path
  	assert_template 'site/index'

    # Check presence of 'New record' link
    assert_select "a[href=?]", new_record_path

  	# Go to 'New record' form
    get new_record_path
    assert_template 'records/new'

    # Check absence of any company in <select>
    assert_select "option", 0

    # Check presence of 'New company' link
    assert_select "a[href=?]", new_company_path

    # Go to 'New company' form
    get new_company_path
    assert_template 'companies/new'

    # Create new company
    assert_difference 'Company.count', 1 do
	    post_via_redirect companies_path, company: { :name => 'Tatneft' }
	  end
    assert_template 'records/new'

    # Check presence of created company in <select>
    assert_select "option", 1
    assert_select "option", 'Tatneft'

    # Check absence of 'New company' link
    assert_select "a[href=?]", new_company_path, false
  end
end
