module SortableHelper
  # Helper method to generate a sortable table in the view
  # 
  # usage: <%= sortable_table(optional_params) %>
  # 
  # optional_params:
  # 
  # :paginate - Whether or not to display pagination links for the table. Default is true.
  # :partial - Name of the partial containing the table to display. Default is the table partial in the sortable
  #            plugin: 'sortable/table'
  #            
  #            If you choose to create your own partial in place of the one distributed with the sortable plugin 
  #            your partial has the following available to it for generating the table:
  #              @headings contains the table heading values
  #              @objects contains the collection of objects to be displayed in the table
  #              
  # :search - Whether or not to include a search field for the table. Default is false.
  #
  def sortable_table(options={})
    paginate = options[:paginate].nil? ? true : options[:paginate]
    partial = options[:partial].nil? ? 'sortable/table' : options[:partial]  
    search = options[:search].nil? ? false : options[:search]

    result = render(:partial => partial, :locals => {:search => search})
    result += will_paginate(@objects) if paginate
    result
  end
 
    
  def sort_td_class_helper(param)
    result = 'sortup' if params[:sort] == param
    result = 'sortdown' if params[:sort] == param + "_reverse"
    result = @sortclass if @default_sort && @default_sort == param    
    return result
  end


  def sort_link_helper(action, text, param, params, extra_params={})
    options = build_url_params(action, param, params, extra_params)
    html_options = {
      :title => "Sort by this field"
    }        
    link_to(text, options, html_options)
  end

  def build_url_params(action, param, params, extra_params={})
    key = param
    if @default_sort_key && @default_sort == param
      key = @default_sort_key
    else
      key += "_reverse" if params[:sort] == param
    end
    params = {:sort => key, 
      :page => nil, # when sorting we start over on page 1
      :query => params[:query], 
      :query_field => params[:query_field]}
    params.merge!(extra_params)

    options = {:action => action, 
      :params => params}
    return options
  end
      
#  def pagination_links(paginator, action, params, extra_params={})
#    page_options = {:window_size => 1}
#    pagination_links_each(paginator, page_options) do |n|
#      params = {:sort => params['sort'], 
#        :page => n, 
#        :query => params[:query], 
#        :query_field => params[:query_field]}
#      params.merge!(extra_params)
#          
#      link_to(n.to_s, {:action => action, :params => params})
#    end
#  end
#
#  def value_provided?(params, name)
#    !params[name].nil? && !params[name].empty?
#  end
end
