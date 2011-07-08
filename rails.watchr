# Run me with:
#
#   $ watchr rails.watchr

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------


#START:MIGRATION
def check_migration migration_file
  system("clear; rake db:migrate:reset")
end
#END:MIGRATION

#START:MIGRATION-SPECS
watch('^db/migrate/\d*_create_(.*)\.rb') { |m| check_migration(m[1]) }

def check_migration migration_file
  system("clear; rake db:migrate:reset")
end

watch('^app/(.*\.rb)') { |m| run_all_specs(m[1]) }

def run_all_specs file_changed
  puts %{You changed: #{file_changed}}  
 system("autotest")
end
#END:MIGRATION-SPECS

# vim:ft=ruby
