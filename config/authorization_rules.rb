authorization do
  role :access do
    has_permission_on [:site], :to => [:index]
  end
end
