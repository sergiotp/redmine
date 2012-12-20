rails_env = ENV['RAILS_ENV'] || 'production'
working_directory "/home/deployer/apps/vota_trespontas/current"
pid "/home/deployer/apps/vota_trespontas/current/tmp/pids/unicorn.pid"
stderr_path "/home/deployer/apps/vota_trespontas/current/log/unicorn.log"
stdout_path "/home/deployer/apps/vota_trespontas/current/unicorn.log"

listen "/tmp/unicorn.vota_trespontas.sock"
worker_processes 2
timeout 30