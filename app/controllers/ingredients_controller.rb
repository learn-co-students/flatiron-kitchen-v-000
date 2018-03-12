class IngredientsController < ApplicationController
  before_action :ingredient_setter, only: [:show, :edit, :update]

      def show
      end

      def index
          @ingredients = Ingredient.all
      end

      def new
          @ingredient = Ingredient.new
      end

      def create
          @ingredient = Ingredient.new(ingredient_params)
          if @ingredient.save
              redirect_to @ingredient
          else
              render :new
          end
      end

      def edit
      end

      def update
          if @ingredient.update(ingredient_params)
              redirect_to @ingredient
          else
              render :edit
          end
      end

      private

      def ingredient_params
          params.require(:ingredient).permit(:name)
      end

      def ingredient_setter
          @ingredient = Ingredient.find(params[:id])
      end

  end
