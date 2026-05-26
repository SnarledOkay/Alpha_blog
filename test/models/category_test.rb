#required for ALL test files
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    #This will run before every test
    def setup 
        @category = Category.new(name: "Sports")
    end

    test "Category should be valid" do 
        assert @category.valid?
    end
    test "name should be present" do
        @category.name = ""
        assert_not @category.valid?
    end
    test "name should be unique" do
        #Must have at least 1 entity of category first
        #This category is saved into the test database and will not affect development database
        @category.save
        @category2 = Category.new(name: "Sports")
        assert_not @category2.valid?
    end
    test "name should not be too long" do 
        @category.name = "a"*26
        assert_not @category.valid?
    end
    test "name should not be too short" do 
        @category.name = "aa"
        assert_not @category.valid?
    end
end