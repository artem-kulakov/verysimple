# User
User.create!(email: 'me@me.com', password: 'hasanyone', reputation: 240, admin: true, name: 'Artem')
User.create!(email: 'user@user.com', password: 'hasanyone', name: 'User')

# Industries
['Oil and gas',
 'Telecom'].each do |industry|
  Industry.create!(name: industry)
end

# Companies
['Rosneft',
 'Gazprom',
 'Lukoil'].each do |company|
  Company.create!(name: company, user_id: 1, industry_id: 1)
end

['MTS',
 'Vimpelcom',
 'Megafon'].each do |company|
  Company.create!(name: company, user_id: 1, industry_id: 2)
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
[ 'Revenues',
  'EBITDA',
  'Net income',
  'Operating cash flow',
  'Capital expenditure',
  'Net debt'].each_with_index do |indicator, index|
    Indicator.create!(name: indicator, order: index, type_id: 1, industry_id: 0)
end

[ 'Oil-equivalent production',
  'Liquids production',
  'Natural gas production'].each_with_index do |indicator, index|
    Indicator.create!(name: indicator, order: index+6, type_id: 2, industry_id: 1)
end

[ 'ARPU',
  'Customer base'].each_with_index do |indicator, index|
    Indicator.create!(name: indicator, order: index+6, type_id: 2, industry_id: 2)
end


# Units
['currency', 'oil'].each do |type|
  Type.create!(name: type)
end

['RUB', 'USD', 'EUR'].each do |name|
  Unit.create!(name: name, type_id: 1)
end

[['kboe/d', 1],
 ['bcf/d', 1/0.0058]].each do |name, multiplier|
  Unit.create!(name: name, type_id: 2, multiplier: multiplier)
end


# Records
Company.where(id: [1, 4]).each do |company|
  Period.where("ending < ?", Date.today).order(:ending).last(2).each do |period|
    Gaap.first(2).each do |gaap|
      Record.create!(company_id: company.id, period_id: period.id, gaap_id: gaap.id, user_id: 1)
    end
  end
end


# Values
amounts = [1000, 500, 200, 100,
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
string = open(Rails.root + 'fx.json').read
json = JSON.parse string
json['rates'].each do |code, rate|
  Currency.create!(code: code)
end

# FX rates
# Save json with FX rates to file
# string = open('https://openexchangerates.org/api/historical/2014-12-31.json?app_id=5b50e8cb7f9346a885b00d1a274b2b89', {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
# File.open("/home/rtmklkv/apps/benchmark/test.json", "w") { |file| file.write string }

ids = Hash[Currency.all.pluck(:code, :id)]

string = open(Rails.root + 'fx.json').read
json = JSON.parse string

day = Period.where("ending < ?", Date.today).order(:ending).last

json['rates'].each do |code, rate|
  rates = day.rates.new
  rates.currency_id = ids[code]
  rates.rate = rate
end


# Save day and rates
day.save


# Forum
 [['One', 'First message'],
  ['Two', 'Second message'],
  ['Three', 'Third message']].each do |title, body|
    Topic.create!(user_id: 1, title: title, body: body)
end

['First post', 'Second post', 'Third post'].each do |body|
  Post.create!(user_id: 2, topic_id: 1, body: body)
end

['4th post', '5th post'].each do |body|
  Post.create!(user_id: 2, topic_id: 2, body: body)
end
