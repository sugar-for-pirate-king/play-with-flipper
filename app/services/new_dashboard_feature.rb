class NewDashboardFeature
  def self.enabled?(user_id)
    new.enabled?(user_id)
  end

  def enabled?(user_id)
    return true if Flipper.enabled?(:new_dashboards)
    return false if user_id.blank?

    activated_gates = Flipper::Adapters::ActiveRecord::Gate.where(
      feature_key: 'new_dashboard',
      key: 'actors'
    )
    return false if activated_gates.blank?

    user_ids = activated_gates.pluck(:value)
    return false unless user_ids.include?(user_id)

    true
  end
end
