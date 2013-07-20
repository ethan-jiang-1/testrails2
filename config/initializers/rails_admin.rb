# RailsAdmin config file. Generated on October 05, 2012 11:38
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Test Rails2', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user_admin } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'Admin'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'Admin'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Appointment', 'Customer', 'Order', 'Patient', 'Physician']
  # config.excluded_models = ['GmapUser','CustomersRoles','LocationRelation', 'AssemblyPart']

  # Include specific models (exclude the others):
  # config.included_models = ['Appointment', 'Customer', 'Order', 'Patient', 'Physician']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]

  #disable authentication - Yizhen
  #config.authenticate_with {}


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Appointment  ###

   config.model 'Appointment' do
        navigation_label 'PPA'
     # You can copy this to a 'rails_admin do ... end' block inside your appointment.rb model definition

     # Found associations:

       configure :physician, :belongs_to_association
       configure :patient, :belongs_to_association

     # Found columns:

       configure :id, :integer
       #configure :physician_id, :integer         # Hidden
       #configure :patient_id, :integer         # Hidden
       configure :appointment_date, :datetime
       #configure :created_at, :datetime
       #configure :updated_at, :datetime

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

       list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
         exclude_fields :created_at, :updated_at
       end

       show do
       end

       edit do
       end

       export do
       end

  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
   end



  ###  Patient  ###

   config.model 'Patient' do
        navigation_label 'PPA'

  #   # You can copy this to a 'rails_admin do ... end' block inside your patient.rb model definition

  #   # Found associations:

       #configure :physicians, :has_many_association
       #configure :appointments, :has_many_association

  #   # Found columns:

       configure :id, :integer
       configure :name, :string
       #configure :created_at, :datetime
       #configure :updated_at, :datetime

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

       list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
         exclude_fields :created_at, :updated_at
       end

       show do
       end

       edit do
         exclude_fields :appointment_ids, :patient_ids
       end

       export do
       end

  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
   end


  ###  Physician  ###

   config.model 'Physician' do
        navigation_label 'PPA'
  #   # You can copy this to a 'rails_admin do ... end' block inside your physician.rb model definition

  #   # Found associations:

       #configure :patients, :has_many_association
       #configure :appointments, :has_many_association

  #   # Found columns:

       configure :id, :integer
       configure :name, :string
       #configure :created_at, :datetime
       #configure :updated_at, :datetime

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

       list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
         exclude_fields :created_at, :updated_at
       end

       show do
       end

       edit do
       end

       export do
       end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
   end



  config.model 'Assembly' do
    navigation_label 'AP'
  end
  config.model 'Part' do
    navigation_label 'AP'
  end
  config.model 'AssemblyPart' do
    navigation_label 'AP'
  end

  config.model 'Post' do
    navigation_label 'Post'
  end
  config.model 'PostComment' do
    #parent 'Post'
    navigation_label 'Post'
  end
  config.model 'PostsPostComments' do
    #parent 'Post'
    navigation_label 'Post'
  end

  config.model 'Role' do
    navigation_label 'CCLRO'
  end
  config.model 'Location' do
    navigation_label 'CCLRO'
  end
  config.model 'Company' do
    navigation_label 'CCLRO'
  end
  config.model 'Customer' do
    navigation_label 'CCLRO'
  end
  config.model 'Order' do
    navigation_label 'CCLRO'
  end
  config.model 'CustomersRoles' do
    navigation_label 'CCLRO'
  end
  config.model 'LocationRelations' do
    navigation_label 'CCLRO'
  end

  config.model 'Employee' do
    navigation_label 'EPP'
  end
  config.model 'Product' do
    navigation_label 'EPP'
  end
  config.model 'Picture' do
    navigation_label 'EPP'
  end

  config.model 'AdminUser' do
    navigation_label 'Account'
  end
  config.model 'User' do
    navigation_label 'Account'
  end
  config.model 'UserAdmin' do
    navigation_label 'Account'
  end

end
