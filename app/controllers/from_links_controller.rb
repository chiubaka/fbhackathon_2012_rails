class FromLinksController < ApplicationController
  def link
    @from_link = FromLink.find_or_create_by_url(params[:from_link][:url])
    if @from_link.save
      to_link = ToLink.find_or_create_by_url_and_form_link_id(url: params[:from_link][:to_link], from_link_id: @from_link.id)
      to_link.frequency += 1
      if to_link.save
        next_link = FromLink.find_by_url(params[:from_link][:to_link])
        render json: next_link
      else
        render json: to_link.errors, status: :unprocessable_entity
      end
    else
      render json: @from_link.errors, status: :unprocessable_entity
    end
  end
end
