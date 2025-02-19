# support parsing time frequency from the tasks
time_frequency_parser = RecurrentTasks::TimeFrequencyParser.new

task_files_directory = 'recurrent_tasks'
task_files_paths = Dir["#{task_files_directory}/**/*"]
puts "WARNING: no recurrent tasks declared in directory '#{task_files_directory}'" if task_files_paths.empty?

task_files_paths.each do |task_file_path|
  task_file = File.open task_file_path
  task_file_json = Oj.load task_file

  title = task_file_json.fetch('title', nil)
  raise "The task file '#{task_file_path}' is missing a 'title' property" unless title

  puts "Declaring Recurrent Tasks: #{title}"
  describe title do
    recurrent_tasks = task_file_json.fetch('recurrent_tasks', nil)
    raise "The task file '#{task_file_path}' is missing a 'recurrent_tasks' list property" unless recurrent_tasks

    recurrent_tasks.each_pair do |recurrent_task_name, recurrent_task_metadata|
      documentation_url = recurrent_task_metadata.fetch('documentation_url', "Missing 'documentation_url' property")

      it "#{recurrent_task_name} | #{documentation_url}" do
        frequency_string = recurrent_task_metadata.fetch('frequency', nil)
        raise "The task '#{recurrent_task_name}' inside '#{task_file_path}' is missing a 'frequency' property" unless frequency_string

        frequency = time_frequency_parser.parse_frequency frequency_string
        last_checked = Time.parse recurrent_task_metadata['last_checked']

        expect(last_checked + frequency)
          .to be > Time.now, "The last time this task was done was '#{last_checked}'" \
                              ", and given the wanted frequency of '#{frequency_string}'" \
                              ', it needs to be done again.'
      end
    end
  end
end
