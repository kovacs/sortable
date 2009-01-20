class Strongbits::UsersController < ActionController::Base

  sortable_table Strongbits::User
  
  # this action shows with pagination
  def index
    get_sorted_objects(params)
  end
  
  # this action doesn't show pagination
  def show
    get_sorted_objects(params)
  end
  
  # this action does a bunch of overrides and does do pagination
  def edit
    get_sorted_objects(params, :include_relations => [:contact_info],
                               :table_headings => [['Username', 'username'], ['Status', 'status'], ['Name', 'name']],
                               :sort_map => {:username => [['strongbits_users.username', 'DESC'], ['strongbits_users.status', 'DESC']], 
                                             :status => ['strongbits_users.status', 'ASC'],
                                             :name => ['strongbits_contact_infos.name', 'DESC']},
                               :default_sort => ['name', 'ASC'],
                               :per_page => 15)
    render :action => 'index'
  end
  
#  TABLE_HEADINGS = [['Status', 'status'],
#                    ['Name', 'name'],
#                    ['User email', 'email',],
#                    ['Created Date', 'created_at']                    ]
#  
#  # this uses the key from the SORT_MAP for the desired column to be the default, as well as providing which direction. DESC or ASC 
#  DEFAULT_SORT = ['email', 'ASC']
#                    
#  # this maps the name of the column sorting param to the DB column. The columns without a table default to the model being queried
#  SORT_MAP = {'status' => ['users.status', 'ASC'], 
#              'name' => ['contact_infos.firstname', 'ASC'],
#              'email' => ['users.email', 'ASC'],
#              'created_at' => ['users.created_at', 'DESC']}
#
#  INCLUDED_RELATIONS = [:contact_info]  
#  
#  SEARCH_OPTIONS = [['', ''],
#                        ['Name', 'name'],
#                        ['User email', 'email']]
#  def list_users
#    @headings = TABLE_HEADINGS
#    get_sorted_objects(User, params, SORT_MAP, INCLUDED_RELATIONS, DEFAULT_SORT)    
#  end
#  
#  SEARCH_MAP = {'email' => ['users.email'],
#                'name' => ['contact_infos.firstname']}
#
#  def search
#    @search_options = SEARCH_OPTIONS
#    @headings = TABLE_HEADINGS
#    search_objects(User, params, SORT_MAP, INCLUDED_RELATIONS, DEFAULT_SORT, SEARCH_MAP)
#  end
#  
#  def list_users_filtered 
#    @search_options = SEARCH_OPTIONS
#    @headings = TABLE_HEADINGS
#    get_sorted_objects(User, params, SORT_MAP, INCLUDED_RELATIONS, DEFAULT_SORT, process_custom_params(params))    
#  end
#
#  def process_custom_params(params)
#    if params[:status]
#      conditions = 'users.status = ' + params[:status]
#    end
#    if params[:verified]
#      verified = 'users.email_verified = ' + params[:verified]
#      if conditions
#        conditions += ' and ' + verified
#      else
#        conditions = verified
#      end         
#    end
#    @extra_params = {:status => params[:status], :verified => params[:verified]}
#    return conditions
#  end
end
