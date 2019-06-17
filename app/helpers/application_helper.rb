module ApplicationHelper
  def build_breadcrumb(category)
    result = []
    category.ancestors.each do |ancestor|
      result << content_tag(:li, class: "breadcrumb-item") do
        link_to(ancestor.name, ancestor)
      end
    end
    result << content_tag(:li, category.name, class: "breadcrumb-item active")
    result.join('').html_safe
  end

  def bootstrap_class_for(name)
    case name
    when success then "alert alert-success"
    
    when danger then "alert alert-danger"
    when alert then "alert alert-warning"
    when notice then "alert alert-info"

    end


  end
end
