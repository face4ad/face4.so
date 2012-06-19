#encoding: UTF-8
module CategoriesHelper

  def nested_categories(categories)
    categories.map do |category, sub_categorys|
      render_cat_link(category) + nested_categories(sub_categorys)
    end.join.html_safe
  end

  def render_cat_link(category)
    #content_tag :li, :escape => false do
    #  link_to "#{get_cat_space(category)}#{category.name}", user_cat_posts_path(:id => category.user.id, :cat_id => category.id)
    #end
    #TODO stuipd content tag not works here to escape the &nbsp;
    "<li><a href='#{user_cat_posts_path(:id => category.user.id, :cat_id => category.id)}'>#{get_cat_space(category)}#{category.name} (#{category.posts.size})</a></li>"
  end

	def get_cat_space(category)
		 raw "&nbsp;" * ( category.depth - 1 ) * 4
	end

  #Use to generate the categories array for select tag
  #Format [ CategoryA, CategoryAa, CategoryAb, CategoryAc ]
  def nested_categories_array(categories, result = [])
    categories.map do |category, sub_categories|
      result << category
      nested_categories_array(sub_categories, result)
    end
    result
  end

  def nested_categories_selection(categories)
    nested_categories_array(@categories).collect{|c|[ "#{get_cat_space(c)} #{c.name}".html_safe , c.id ]}.unshift(["请选择一个分类", 0])
  end

end
