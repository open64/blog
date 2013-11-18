module SessionsHelper
	def sing_in(account)
		cookies.permanent[:remember_token] = account.remember_token
		self.current_account = account
	end

	def current_account=(account)
		@current_account = account
	end

	def current_account
		@current_account ||= Account.find_by_remember_token(cookies[:remember_token])
	end

	def signed_in?
		!current_account.nil?
	end

	def sign_out
		self.current_account = nil
		cookies.delete(:remember_token)
	end
end
