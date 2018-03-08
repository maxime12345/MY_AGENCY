module ApplicationHelper


  def link_to_with_actif(path)
    active = (Rails.application.routes.recognize_path(path)[:controller] == params[:controller])
    link_to path, class: "#{'tab-active' if active}" do
      yield
    end
  end

end
