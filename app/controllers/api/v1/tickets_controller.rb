module Api
  module V1
    class TicketsController < ApplicationController
      before_action :set_ticket, only: [:update, :destroy]


      # POST api/v1/tickets
      def create
        @ticket = Ticket.new(ticket_params)

        if @ticket.save
          render json: @ticket, status: :created, location: @ticket
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT api/v1/tickets/1
      def update
        if @ticket.update(ticket_params)
          render json: @ticket
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
      end

      # DELETE api/v1/tickets/1
      def destroy
        @ticket.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_ticket
        @ticket = Ticket.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ticket_params
        params.require(:ticket).permit(:title, :description, :assigned_user_id, :due_date, :status_id, :progress)
      end
    end
  end
end
