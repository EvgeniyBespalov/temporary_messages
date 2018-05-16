class MessagesController < ApplicationController
  before_action :set_translation, only: :create 
  def index
  end
  def create
  
    description = params[:description]
    message = Message.new(description: description)

    count = session[:count] ? session[:count] : 0
    count += 1
    session[:count] = count

    respond_to do |format|
      format.json {render json: {
        date: Time.new, 
        count: count, 
        request_description: I18n.translate(:requests, count: count)}}
    end
  end
  
  private
  def set_translation
    I18n::Backend::Simple.include(I18n::Backend::Pluralization)
    I18n.backend.store_translations :ru,  i18n: { plural: { rule: lambda { |n| n % 10 == 1 && n % 100 != 11 ? :one : (2..4).include?(n % 10) && !(12..14).include?(n % 100) ? :few : n % 10 == 0 || (5..9).include?(n % 10) || (11..14).include?(n % 100) ? :many : :other } } }
  end

end
