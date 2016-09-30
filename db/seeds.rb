# User
User.create!(email: 'artem.kulakov@gmail.com', password: 'hasanyone', reputation: 240, admin: true)
User.create!(email: 'user@user.com', password: 'hasanyone')

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

['RUB', 'USD', 'EUR'].each do |name|
  Unit.create!(name: name, section_id: 1, type_id: 1)
end

[['mln bbl', 1],
 ['mln ton', 7.33]].each do |name, multiplier|
  Unit.create!(name: name, section_id: 2, type_id: 2, multiplier: multiplier)
end


# Records
Company.first(2).each do |company|
  Period.first(2).each do |period|
    Gaap.first(2).each do |gaap|
      Record.create!(company_id: company.id, period_id: period.id, gaap_id: gaap.id, user_id: 1)
    end
  end
end


# Values
amounts = [1000, 500, 100, 100,
           2000, 1000, 200, 100,
           3000, 1500, 300, 100,
           4000, 2000, 400, 100,
           5000, 2500, 500, 100,
           6000, 3000, 600, 100,
           7000, 3500, 700, 100,
           8000, 4000, 800, 100]
Record.all.each do |record|
  Indicator.first(4).each do |indicator|
    Value.create!(record_id: record.id, indicator_id: indicator.id, amount: amounts.shift, unit_id: 1)
  end
end


# Currencies
require 'open-uri'
string = open('https://openexchangerates.org/api/currencies.json', {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
hash = JSON.parse string
hash.each do |code, name|
  Currency.create!(code: code, name: name)
end

# FX rates
# Save json with FX rates to file
# string = open('https://openexchangerates.org/api/historical/2014-12-31.json?app_id=5b50e8cb7f9346a885b00d1a274b2b89', {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
# File.open("/home/rtmklkv/apps/benchmark/test.json", "w") { |file| file.write string }

ids = Hash[Currency.all.pluck(:code, :id)]

string = open(Rails.root + 'fx.json').read
json = JSON.parse string

bar = Period.find(1)

json['rates'].each do |code, rate|
  foo = bar.rates.new
  foo.currency_id = ids[code]
  foo.rate = rate
end


# Save day and rates
bar.save
