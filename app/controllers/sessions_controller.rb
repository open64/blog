class SessionsController < ApplicationController
	def new
	end

	def create
		account = Account.find_by_email(params[:session][:email].downcase)
		if account && account.authenticate(params[:session][:password])
			sing_in account
			redirect_to account
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
