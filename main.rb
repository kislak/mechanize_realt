require 'rubygems'
require 'mechanize'
require 'pry'

agent = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}

references = %w(
  971183
  444301
)

KEYS = [
  "Комнат всего/разд.",
  "Этаж / этажность",
  "Тип дома",
  "Площадь общая/жилая/кухня",
  "Планировка",
  "Высота потолков",
  "Год постройки",
  "Сан/узел",
  "Балкон",
  "Ремонт",
  "Дополнительно",
  
   "Область",
   "Населенный пункт",
   "Адрес",
   "Район город",

   "Условия продажи",
   "Собственность",
   "Ориентировочная стоимость эквивалентна",
  
   "Дата обновления",
   "Телефоны",
   "Агентство"
]

def get(agent, ref)
  res = {}
  agent.get("http://realt.by/sale/flats/object/#{ref}/") do |page|
    KEYS.each do |key|
      item = page.at("td:contains('#{key}')")
      value = item&.next&.next&.text
      res[key] = value 
    end
  end
  res
end

references.each do |ref|
  Pry::ColorPrinter.pp( get(agent, ref) )
end
  




