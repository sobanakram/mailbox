Trestle.resource(:users, model: User, scope: Auth) do
  menu do
    group :configuration, priority: :last do
      item :users, icon: 'fa fa-users'
    end
  end

  # Define custom scopes for the index view
  scopes do
    scope :all, default: true
    scope :admin
    scope :user
  end

  table do
    # column :avatar, header: false do |administrator|
    #   avatar_for(administrator)
    # end
    column :first_name
    column :email, link: true
    column :_type
    actions do |a|
      a.delete unless a.instance == current_user
    end
  end

  form do |_user|

    row do
      col(sm: 6) { text_field :first_name }
      col(sm: 6) { text_field :last_name }
    end

    text_field :email
    select :_type, User._types.keys, include_blank: true

    row do
      col(sm: 6) { password_field :password }
      col(sm: 6) { password_field :password_confirmation }
    end
  end
end
