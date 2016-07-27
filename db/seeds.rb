# Companies
companies = ['Rosneft',
             'Gazprom',
             'Lukoil']
companies.each do |company|
  Company.create!(name: company)
end

# Indicators
indicators = ['Revenues',
             'Operating income',
             'Debt']
indicators.each do |indicator|
  Indicator.create!(name: indicator)
end

# Records
Company.first(3).each do |company|
  Record.create!(company_id: company.id)
end

# Values
amounts = [1000, 100, 1500,
           2000, 200, 3000,
           3000, 300, 4500]
Record.all.each do |record|
  Indicator.all.each do |indicator|
    Value.create!(record_id: record.id, indicator_id: indicator.id, amount: amounts.shift)
  end
end

# Periods
[2014, 2015].each do |year|
  [3, 6, 9, 12].each do |month|
    Period.create!(ending: Date.new(year, month, -1))
  end
end
