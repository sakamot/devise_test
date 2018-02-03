module Api
  class UsersController < ActionController::API
    before_action :set_json_request
    before_action :set_user

    def sign_up
      unless @user.valid?
        json = { "message": @user.errors.full_messages.join('\n') }
        return render status: 403, json: json
      end
      user_save!
      return render status: 200
    end

    private

    def set_user
      unless keys_correct?
        return render status: 404, json: {"message": "パラメータが不正です。"}
      end
      @user = User.new(@json_request)
    end

    def keys_correct?
      @json_request.keys.sort == User::API_COLUMNS
    end

    def user_save!
      @user.skip_confirmation!
      begin
        @user.save!
      rescue => e
        logger.debug e
        json = {"message": "サーバーエラーが発生しました。"}
        return render status: 500, json: json
      end
    end

    def set_json_request
      @json_request = JSON.parse(request.body.read)
    end
  end
end
