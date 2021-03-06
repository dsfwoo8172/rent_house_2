module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update destroy]
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      
      if @user.save
        redirect_to admin_users_path, notice: "#{user.email} has created successfully!"
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "#{user.email} has updated successfully!"
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: "#{user.email} has destroyed successfully!"
    end


    private

    def set_user
      @user = User.find(params[:id])
    end
  end
end