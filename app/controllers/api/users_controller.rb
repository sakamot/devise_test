module Api
  class UsersController < ActionController::API
    before_action :set_json_request
    before_action :set_user

    def sign_up
      unless @user.valid?
        return render inline: "Bad Data:#{@user.errors.full_messages.join('\n')}"
      end
      user_save!
      return render inline: 'OK! Registration Success!'
    end

    private

    def set_user
      begin
        @user = User.new(@json_request)
      rescue => e
        logger.debug e
        return render inline: 'Error'
      end
    end

    def user_save!
      @user.skip_confirmation!
      begin
        @user.save!
      rescue => e
        logger.debug e
        return render inline: 'Error!'
      end
    end

    def set_json_request
      @json_request = JSON.parse(request.body.read)
    end
  end
end
