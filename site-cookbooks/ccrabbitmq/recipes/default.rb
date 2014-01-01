rabbitmq_policy "ha-all" do
  pattern "^(?!amq\\.).*"
  params({"ha-mode" => "all"})
  priority 1
  action :set
end
