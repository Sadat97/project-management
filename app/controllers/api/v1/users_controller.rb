# frozen_string_literal: true

module Api
  module V1
    # Users controller responsible for CRUD operations on users
    class UsersController < ApplicationController
      before_action :set_user, only: [:update]

      # POST api/v1/users
      def create
        @user = Ticket.new(ticket_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT api/v1/users/:id
      def update
        if @user.update(user_params)
          render json: 'User profile has been updated successfully', status: :ok
        else
          render json: @user.errors.full_messages, status: :unprocessable_entity
        end
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :mail, :send_due_date_reminder, :due_date_reminder_interval,
                                     :due_date_reminder_time, :time_zone)
      end
    end
  end
end
