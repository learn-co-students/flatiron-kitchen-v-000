require 'test_helper'

class RecipeIngredientsControllerTest < ActionController::TestCase
  test "should get recipe:belongs_to" do
    get :recipe:belongs_to
    assert_response :success
  end

  test "should get ingredient:belongs_to" do
    get :ingredient:belongs_to
    assert_response :success
  end

end
