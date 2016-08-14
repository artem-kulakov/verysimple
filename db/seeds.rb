# Companies
companies = ['Rosneft',
             'Gazprom',
             'Lukoil']
companies.each do |company|
  Company.create!(name: company)
end

# Periods
(2014..2018).to_a.each do |year|
  [3, 6, 9, 12].each do |month|
    Period.create!(ending: Date.new(year, month, -1))
  end
end

# GAAPs
['IFRS', 'Local GAAP', 'US GAAP'].each do |gaap|
  Gaap.create!(name: gaap)
end

# Indicators
indicators = ['Revenues',
             'EBITDA',
             'Net income',
             'Net debt',
             'Free cash flow',
             'Capex',
             'Oil production',
             'Oil processing',
             'Refined products production']
indicators.each_with_index do |indicator, index|
  Indicator.create!(name: indicator, order: index)
end

# Records
Company.first(2).each do |company|
  Period.first(2).each do |period|
    Gaap.first(2).each do |gaap|
      Record.create!(company_id: company.id, period_id: period.id, gaap_id: gaap.id)
    end
  end
end

# Values
amounts = [1000, 500, 100,
           2000, 1000, 200,
           3000, 1500, 300,
           4000, 2000, 400,
           5000, 2500, 500,
           6000, 3000, 600,
           7000, 3500, 700,
           8000, 4000, 800]
Record.all.each do |record|
  Indicator.first(3).each do |indicator|
    Value.create!(record_id: record.id, indicator_id: indicator.id, amount: amounts.shift)
  end
end
