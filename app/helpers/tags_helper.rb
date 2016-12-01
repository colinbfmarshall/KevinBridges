module TagsHelper

def popular_tags
  if @tags.present?
    @tags.map {|t| t.name}.join(' ')
  else
    "Long Short Curly Straight Colouring"
  end 
end

end
