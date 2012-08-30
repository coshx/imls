module ApplicationHelper

  def onload_method
    if params[:q].blank? && params[:f].blank? && params[:id].nil?
      "$('input#q').focus();"
    end
  end
end
