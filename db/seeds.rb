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
             'Net income']
indicators.each_with_index do |indicator, index|
  Indicator.create!(name: indicator, order: index, type_id: 1)
end

Indicator.create!(name: 'Oil production', order: 3, type_id: 2)


# Units

['Financial', 'Operational'].each do |section|
  Section.create!(name: section)
end

['currency', 'oil'].each do |type|
  Type.create!(name: type)
end

['RUB', 'USD'].each do |currency|
  Unit.create!(name: currency, section_id: 1, type_id: 1)
end

['mln ton', 'mln boe'].each do |name|
  Unit.create!(name: name, section_id: 2, type_id: 2)
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
    Value.create!(record_id: record.id, indicator_id: indicator.id, amount: amounts.shift, unit_id: 1)
  end
end
