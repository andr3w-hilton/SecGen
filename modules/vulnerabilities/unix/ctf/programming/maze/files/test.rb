#!/usr/bin/ruby
def generate_maze
  # maze_output = `/usr/bin/ruby <%=@challenge_dir-%>/maze.rb 10 10 `
  maze_output = `ruby maze.rb 10 10 `

  maze_arr = maze_output.split("*********")
  maze = maze_arr.first
  solution = maze_arr.last[1..-1]
  [maze, solution]
end

_, example_solution = generate_maze

puts 'Solve the maze, quickly!'
puts 'Use "@" characters to fill correct path through the maze.'
sleep(1.5)
puts 'Here is an example of a solved maze: '
sleep(1.5)
puts "\n #{example_solution}"
sleep(1.5)
puts('Get ready...')


maze, solution = generate_maze

puts maze
#TODO remove me:
puts solution
puts 'solution: '

response = []
(0..20).each {|i| response << gets}

puts '*********'
answer = response.join
puts answer

# Remove carriage returns and newlines for comparison
if answer.gsub(/\r?\n/, " ") == solution.gsub(/\r?\n/, " ")
  puts 'Congrats!'
else
  puts 'Incorrect, expected answer: '
  puts solution
end