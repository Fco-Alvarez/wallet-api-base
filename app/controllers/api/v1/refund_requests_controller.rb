# frozen_string_literal: true

module Api
  module V1
    class RefundRequestsController < ApplicationController
      def index
        @refund_requests = RefundRequest.all
      end

      def new
        @refund_request = RefundRequest.new
      end

      def create
        @refund_request = RefundRequest.new(refund_request_params)

        if @refund_request.save
          render :show, status: :created, location: @refund_request
        else
          render json: @refund_request.errors, status: :unprocessable_entity
        end
      end

      private

      def refund_request_params
        params.require(:refund_request).permit(:concept, :state, :movement_id)
      end
    end
  end
end
