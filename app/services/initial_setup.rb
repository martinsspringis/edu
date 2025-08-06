class InitialSetup
  def initializer
  end

  def perform
    puts "Setting up initial configuration for Johsn..."
    # Additional setup logic can be added here

    Person.transaction do
      Person.create(first_name: 'John', last_name: 'Does')
      # Person.create!(first_name: nil, last_name: 'Smith')
      1/0
      puts "Created initial people records."
    end 
  end
end