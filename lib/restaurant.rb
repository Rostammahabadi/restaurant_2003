class Restaurant

  attr_reader :opening_time, :name, :dishes, :stripped_time, :menu_dish_names

  def initialize(time, name)
    @opening_time = time
    @name = name
    @dishes = []
    @closing_time = @opening_time
    @stripped_time = @opening_time.to_i
    @menu_dish_names = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def closing_time(time)
    added_time = @stripped_time + time
    reformat = added_time.to_s + ":00"
    return reformat
  end

  def open_for_lunch?
    if self.stripped_time > 12
      return true
    elsif self.stripped_time < 12
      return false
    end
  end

  def menu_dish_names
    dishes.each do |dish|
      @menu_dish_names << dish.upcase
    end
    @menu_dish_names
  end

  def announce_closing_time(closing_time)
    new_closing_time = self.stripped_time + closing_time
    if new_closing_time < 12
      am_closing_time = new_closing_time.to_s + ":00AM"
      return "#{self.name} will be closing at #{am_closing_time}"
    else
      pm_announcement = new_closing_time - 12
      pm_announcement_string = pm_announcement.to_s + ":00PM"
      return "#{self.name} will be closing at #{pm_announcement_string}"
    end

  end
end
