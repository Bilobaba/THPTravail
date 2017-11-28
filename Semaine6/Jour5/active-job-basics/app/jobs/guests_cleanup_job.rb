class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(msg)
    # Do something later
    puts "================================================================="
    puts "Execution du job"
    puts DateTime.now.to_time
    puts msg
    GuestsCleanupJob.set(wait_until: Time.new + 5).perform_later("Coucou Duy")
  end
end
