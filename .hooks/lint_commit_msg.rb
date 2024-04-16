# .hooks/lint_commit_msg.rb

# Import required library
require 'fileutils'

def validate_commit_msg
  # Get the current directory
  root_dir = FileUtils.pwd

  # Get the commit file
  commit_file = File.join(root_dir, '.git/COMMIT_EDITMSG')
  commit_message = File.read(commit_file) if File.exist?(commit_file)

  # Define the regex pattern
  reg_exp = /^(Update|Delete|Add|Create|Change|Fix) [a-zA-Z\d ]{5,100}$/

  if commit_message
    valid = commit_message.match?(reg_exp)

    if valid
      puts 'Nice commit message!'
    else
      puts 'Bad commit message!'
      puts "Your commit message: '#{commit_message.strip}'"
      puts "The commit message does not follow the required format: 'Type description'"
      puts "Type should be one of the following: Update, Delete, Add, Create, Change, Fix"
      puts 'Description should be a brief summary of the changes made, between 5 and 100 characters'
      exit(1)
    end
  else
    puts 'Commit message file does not exist'
    exit(1)
  end
end

validate_commit_msg
