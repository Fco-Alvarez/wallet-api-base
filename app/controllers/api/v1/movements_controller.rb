# frozen_string_literal: true

module Api
  module V1
    class MovementsController < ApplicationController
      has_scope :by_concept
      has_scope :by_type
      has_scope :by_account

      # GET /movements
      def index
        @movements = if @current_user.rol == 'admin'
                       @pagy, @records = pagy(Movement.all.order(date: :desc))
                     else
                       apply_scopes(Movement.where(user_id: @current_user.id).order(date: :desc))
                     end

        render json: @movements
      end

      # POST /movements
      def create
        @movement = Movement.new(movement_params)
        @movement.user_id = @current_user.id
        @movement.date = Time.zone.today
        # if @movement.save(context: :create_from_controller)
        if @movement.valid?(:create_from_controller)
          @movement.save
          account = @movement.account
          account.update_column(:total, account.total + @movement.amount.to_f)
          render :show, status: :created
        else
          render json: @movement.errors, status: :unprocessable_entity
        end
      end

      # GET /movements/1
      def show
        @movement = Movement.find(params[:id])
        @movementlogs = Movementlog.where(movement_id: @movement.id)

        render :show
      end

      # PATCH/PUT /movements/1
      def update
        if @movement.update(movement_params)
          render json: @movement
        else
          render json: @movement.errors, status: :unprocessable_entity
        end
      end

      # POST movements/transfer
      def transfer
        @movement = Movement.new(movement_params)
        @movement.date = Time.zone.today
        @movement.kind = 'payment'
        destination_account_id = params[:movement][:destination_account_id]
        destination_account = account_belongs_recipient(destination_account_id)
        @movement.user = destination_account.user if destination_account
        if @movement.valid?(:money_transfer)
          # @receiving_user = User.find_by(id: @movement.user_id)
          @receiving_user = destination_account.user
          if destination_account_id && account_belongs_issuer
            @movement.save
            account = @movement.account
            # updates accounts
            account.update_column(:total, account.total - @movement.amount.to_f)
            destination_account.update_column(:total,
                                              destination_account.total + @movement.amount.to_f)
            Movement.create(
              user: @current_user,
              amount: @movement.amount,
              concept: @movement.concept,
              date: Time.zone.today,
              kind: 'topup',
              account_id: destination_account_id
            )
            render :transfer, status: :created
          else
            message = if destination_account_id
                        'La cuenta no coincide con el que inicion sesión ó la cuenta destino
                          no coincide el usuario a quien se esta enviando el dinero'
                      else
                        'Se necesita la cuenta a quien se esta enviando'
                      end
            render json: { errors: message }, status: :unprocessable_entity
          end
        else
          render json: { errors: @movement.errors.messages }, status: :unprocessable_entity
        end
      end

      def account_belongs_recipient(destination_account_id)
        # verificando la cuenta destino del user_id
        Account.find_by(id: destination_account_id)
      end

      def account_belongs_issuer
        # verifica que el usuario que inicio sesion
        # sea su cuenta. pero esto no deberia pasar desde el front xd
        @current_user.accounts.find_by(id: @movement.account_id)
      end

      private

      # Only allow a list of trusted parameters through.
      def movement_params
        params.require(:movement).permit(:amount, :concept, :date, :kind, :account_id, :user_id)
      end
    end
  end
end
