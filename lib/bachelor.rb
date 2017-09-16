def get_first_name_of_season_winner(data, season)
  data[season].each do |hsh|
    if hsh["status"].downcase == "winner"
      return hsh["name"].split(" ").first
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, ary|
    ary.each do |hsh|
      return name = hsh["name"] if hsh["occupation"].downcase == occupation.downcase
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = Hash.new(0)
  data.each do |season, ary|
    ary.each do |hsh|
      count[hsh["hometown"]] += 1
    end
  end
  count[hometown]
end

def get_occupation(data, hometown)
  data.each do |season, ary|
    ary.each do |hsh|
      return hsh["occupation"] if hsh["hometown"].downcase == hometown.downcase
    end
  end
end

def get_average_age_for_season(data, season)
  total = data[season].inject(0) { |memo, hsh| memo += hsh["age"].to_i }
  avg = total.to_f / data[season].length
  avg.round
end
