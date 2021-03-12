def create_output(mid_row, border_row)
    #output combined rows for title card
    puts "#{border_row}\n#{mid_row}\n#{border_row}"
    puts
    puts
end




loop do
    # Get lesso number and title input
    print "Lesson Number: "
    lesson_num = gets.chomp
    print "Title: "
    title = gets.chomp
    30.times{print "-" }
    puts
    puts 
    #construct middle row
    mid_row = "#       #{lesson_num}. #{title}      #"
    # Construct top and bottom rows
    border_row = "##{"=" * (mid_row.length - 2)}#"

    if border_row.length <= 80
        create_output(mid_row, border_row)
        break
    else
        print "Would you like to try a shorter title? (y/n): "
        response = gets.chomp.downcase
        puts
        break if response != "y"
    end
end