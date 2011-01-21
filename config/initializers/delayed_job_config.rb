Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.sleep_delay = 60
Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 5.minutes

#Delayed::Worker.logger = Rails.logger
#Delayed::Worker.logger.auto_flushing = 1 # or whatever


