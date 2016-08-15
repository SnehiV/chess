require 'byebug'

class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end


  def bonus(multiplier)
    # debugger
    queue = self.employees.dup
    salary_total = queue.inject(0) { |total, employee| total + employee.salary}
    until queue.empty?
      return salary_total if self.class == Employee
      employee = queue.shift
      salary_total += employee.bonus(1) unless employee.class == Employee
    end
    salary_total * multiplier
  end

end


david = Employee.new("Fred Wilkins", "Janitor", 10_000, nil)
shawna = Employee.new("Dan Snedeker", "Lunchlady", 12_000, nil)
darren = Manager.new("Jim Rendle", "Teacher", 78_000, nil, [david, shawna])
ned = Manager.new("Ned Medley", "Principal", 1_000_000, nil, [darren])
