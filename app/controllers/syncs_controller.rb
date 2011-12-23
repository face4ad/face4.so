# encoding: UTF-8
class SyncsController < ApplicationController

  #before_filter :login_required

  def new
    client = OauthChina::Sina.new
    authorize_url = client.authorize_url
    Rails.cache.write(build_oauth_token_key(client.name, client.oauth_token), client.dump)
    redirect_to authorize_url
  end

  def callback
    client = OauthChina::Sina.load(Rails.cache.read(build_oauth_token_key(params[:type], params[:oauth_token])))
    client.authorize(:oauth_verifier => params[:oauth_verifier])

    results = client.dump
    logger.debug("results: #{results}")

    if results[:access_token] && results[:access_token_secret]
      #在这里把access token and access token secret存到db
      #下次使用的时候:
      #client = OauthChina::Sina.load(:access_token => "xx", :access_token_secret => "xxx")
      #client.add_status("同步到新浪微薄..")
      flash[:notice] = "授权成功！"
      
      #check account is existing or not
      resp = client.get '/account/verify_credentials.json'
      sina_json_data = resp.body
      sina_hash = ActiveSupport::JSON.decode(sina_json_data)
      sina_id = sina_hash['id']
      sina_name = sina_hash['name']

      #save sina_id, sina name in session
      session[:sina_id] = sina_id
      session[:sina_name] = sina_name
      
      #check user existing or not
      logger.debug("find the user by sina id #{sina_id}")
      user = User.find_by_sina_id(sina_id)

      #yes, simulate login process, set session
      if not user.nil?
        logger.debug("user is existing, directly help him to sign in")
        #user.confirm! if not user.confirmed?
        sign_in(:user, user)

        #Save the access token and secret token, in future it can use to call sina api
        user.access_token = results[:access_token]
	user.access_token_secret = results[:access_token_secret]
	user.save

        #simply redirect to dashboard, will not check ative or not here
        redirect_to dashboard_path and return
      else
        logger.debug("no such sina user, ready to prepare the sign up form")
        #if user directly go to this path without sina auth, it would be failed.	
	redirect_to new_user_registration_path 
      end
    else
      flash[:notice] = "授权失败!"
      render :text => "something wrong in sina side"
    end
    #redirect_to account_syncs_path
  end

  private
  def build_oauth_token_key(name, oauth_token)
    [name, oauth_token].join("_")
  end

end
