json.array!(@pages) do |page|
  json.extract! page, :id, :name, :short_name, :title, :meta_keywords, :meta_description, :content, :allow_user, :show, :index
  json.url page_url(page, format: :json)
end
