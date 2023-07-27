class BaseView
  def display(elements)
    elements.each_with_index do |element, index|
      puts print_sentence(element,index)
    end
  end

  def ask_for(stuff)
    puts stuff + "?"
    print "> "
    gets.chomp
  end
end