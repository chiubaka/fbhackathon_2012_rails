class FromLinksController < ApplicationController
  def link
    @from_link = FromLink.find_or_create_by_url(params[:from_link][:url])
    if @from_link.save
      to_link = ToLink.find_by_from_link_id_and_url(@from_link.id, params[:from_link][:to_link]) 
      to_link = ToLink.new(url: params[:from_link][:to_link], from_link_id: @from_link.id) if to_link.nil?
      
      to_link.frequency += 1
      if to_link.save
        next_link = FromLink.find_by_url(params[:from_link][:to_link])
        #render json: next_link.to_json(include: [:to_links])
        render json: "success".to_json
      else
        render json: to_link.errors, status: :unprocessable_entity
      end
    else
      logger.debug "Returning error JSON."
      render json: @from_link.errors, status: :unprocessable_entity
    end
  end
end
