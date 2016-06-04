# Companies
companies = ['Rosneft',
             'Gazprom',
             'Lukoil',
             'Tatneft',
             'Gazpromneft',
             'Slavneft',
             'Surgutneftegaz',
             'British Petroleum',
             'Royal Dutch Shell']
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

# Reports
Company.first(3).each do |company|
	Report.create!(company_id: company.id)
end

# Values
amounts = [1000, 100, 1500,
					 2000, 200, 3000,
					 3000, 300, 4500]
Report.all.each do |report|
	Indicator.all.each do |indicator|
		Value.create!(report_id: report.id, indicator_id: indicator.id, amount: amounts.shift)
	end
end