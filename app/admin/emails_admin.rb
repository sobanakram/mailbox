Trestle.resource(:emails) do
  menu do
    item :emails, icon: 'fa fa-envelope'
  end

  collection do
    model.order(created_at: :desc)
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :user
    column :user_email
    column :subject
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |email|
    row do
      col { text_field :user_name }
      col { text_field :user_email }
    end

    text_field :subject
    select :user_id, User.all

    editor :content

    datetime_field :discarded_at
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:email).permit(:name, ...)
  # end
end
