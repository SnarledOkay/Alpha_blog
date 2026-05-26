require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    #Get the create category form
    get "/categories/new"
    assert_response :success #Must go to form successfully
    #Check if number of categories have increased by 1
    assert_difference 'Category.count',1 do
      post categories_path, params:{category:{name:"Sports"}}
      assert_response :redirect #Must then redirect to 'show' page
    end
    follow_redirect! #go to redirected page
    assert_response :success
    assert_match "Sports", response.body #Must get 'Sports' from body
  end

  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params:{category:{name:" "}}
    end
    # Check if the word 'errors' is present in the response
    assert_match "errors", response.body
    # Or check if specific HTML elements are present
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end


