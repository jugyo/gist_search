begin
  Groonga::Context.default_options = {:encoding => :utf8}
  Groonga::Database.open(CONFIG['db']['path'])
rescue => e
  warn "DB is not created."
end