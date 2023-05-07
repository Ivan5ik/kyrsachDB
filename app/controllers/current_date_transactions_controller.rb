class CurrentDateTransactionsController < ApplicationController
  def destroy
    CurrentDateTransaction.find(params[:id]).destroy

    flash[:notice] = 'Current date transaction was destroyed'

    redirect_to current_date_transactions_pages_path
  end

  def new; end

  def create
    CurrentDateTransaction.create(current_date_transaction_params)

    flash[:notice] = 'Current date transaction was created'

    redirect_to current_date_transactions_pages_path
  end

  def update
    current_date_transaction = CurrentDateTransaction.find(params[:id])

    current_date_transaction.update(current_date_transaction_params)

    flash[:notice] = 'Current Date Transaction was updated'

    redirect_to current_date_transactions_pages_path
  end

  def edit
    @current_date_transaction = CurrentDateTransaction.find(params[:id])
  end

  private

  def current_date_transaction_params
    params.require(:current_date_transaction).permit(CurrentDateTransaction.column_names.map(&:to_sym))
  end
end
