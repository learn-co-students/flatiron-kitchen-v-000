require 'test_helper'

class NewIngredientsControllerTest < ActionController::TestCase
  setup do
    @new_ingredient = new_ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:new_ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new_ingredient" do
    assert_difference('NewIngredient.count') do
      post :create, new_ingredient: {  }
    end

    assert_redirected_to new_ingredient_path(assigns(:new_ingredient))
  end

  test "should show new_ingredient" do
    get :show, id: @new_ingredient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @new_ingredient
    assert_response :success
  end

  test "should update new_ingredient" do
    patch :update, id: @new_ingredient, new_ingredient: {  }
    assert_redirected_to new_ingredient_path(assigns(:new_ingredient))
  end

  test "should destroy new_ingredient" do
    assert_difference('NewIngredient.count', -1) do
      delete :destroy, id: @new_ingredient
    end

    assert_redirected_to new_ingredients_path
  end
end
