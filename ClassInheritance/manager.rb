require_relative 'employee'

class Manager < Employee
  def initialize(name, title, salary, boss, employees = [])
    @employees = employees  
    super(name, title, salary, boss)
  end
  
  #bonus = (total salary of all sub-employees) * multiplier
  def bonus(multiplier)
    bonus = 0

    employees.each do |employee|
      bonus += (employee.salary) * multiplier
      if employee.is_a?(Manager)
        bonus += employee.bonus(multiplier)
      end
    end
    bonus
  end
  private
  
  attr_reader :employees
end

ta1 = Employee.new("Shawna","TA",12000, nil)
ta2 = Employee.new("David", "TA", 10000, nil)
manager = Manager.new("Darren", "TA Manager", 78000, nil, [ta1,ta2])
founder = Manager.new("Ned","Founder", 1000000,nil, [manager])

p founder.bonus(5)