#!/usr/bin/env ruby

  def division
    div = Array.new
    by = Array.new
    loop do
    div = [*1..100].sample
    by = [*2..10].sample
    break if div >= by && div % by == 0
      end
      "#{div} / #{by}"
    end
  
  def subtract
    sub = Array.new
    by = Array.new
    loop do
    sub = [*1..100].sample
    by = [*1..100].sample
    break if sub >= by
      end
      "#{sub} - #{by}"
    end
  
  def multiply
    "#{[*1..10].sample} x #{[*1..10].sample}"
    end
  
  def add
    "#{[*1..100].sample} + #{[*1..100].sample}"
    end
  
  lives = 3
  ca = 0
  puts "Can You Get Five in a Row??"
  loop do
  # q = Question
  q = [division, multiply, add, subtract].sample
  
  print "What's #{q} = "
  # a = Answer
  a = gets.chomp.to_i
  
  m = ["+", "x","-","/"]
  
  if q.split(" ").include?("+")
  correct_a = q.split(" ").delete_if {|x| m.include?x}.map {|z| z.to_i}.inject(:+)
  elsif q.split(" ").include?("x")
  correct_a = q.split(" ").delete_if {|x| m.include?x}.map {|z| z.to_i}.inject(:*)
  elsif q.split(" ").include?("/")
  correct_a = q.split(" ").delete_if {|x| m.include?x}.map {|z| z.to_i}.inject(:/)
  else
  correct_a = q.split(" ").delete_if {|x| m.include?x}.map {|z| z.to_i}.inject(:-)
  end
  
  
  
    if a.to_i == correct_a && ca == 4
      ca += 1 
    elsif a.to_i == correct_a
      ca += 1
        puts "Correct! Keep going, only #{5 - ca} more to go!"
    elsif a.to_i != correct_a && lives == 1
      lives -= 1
    else a.to_i != correct_a
      lives -= 1
        puts "Nope, the answer is #{correct_a}... start again! Lives Remaining: #{lives}"
        ca *= 0
    end
  break if ca == 5||lives == 0
end

puts "YOU WIN!!!" if ca == 5
puts "YOU LOSE!!!" if lives == 0