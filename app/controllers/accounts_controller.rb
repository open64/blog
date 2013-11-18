#include SessionsHelper

class AccountsController < ApplicationController
	def new
		@account = Account.new
	end

	def show
		@account = Account.find(params[:id])
	end
	def create
		@account = Account.new(params[:account])
		if @account.save
			#sign_in @account
			redirect_to @account
		else
			render 'new'
		end
	end
end
