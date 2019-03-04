def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash.each {
    |team,team_hash|
    team_hash[:players].each {
      |name, stats_hash|
      if name == player
        return stats_hash[:points]
      end
    }
  }
end

def shoe_size(player)
  game_hash.each {
    |team,team_hash|
    team_hash[:players].each {
      |name, stats_hash|
      if name == player
        return stats_hash[:shoe]
      end
    }
  }
end

def team_colors(team_name)
  game_hash.each {
    |team,team_hash|
    if team_hash[:team_name] == team_name
      return team_hash[:colors]
    end
  }
end

def team_names
  names = []
  game_hash.each {
    |team,team_hash|
    names.push(game_hash[team][:team_name])
  }
  names
end

def player_numbers(team_name)
  numbers = []
  game_hash.each {
    |team,team_hash|
    if team_hash[:team_name] == team_name
      team_hash[:players].each {
        |name,stats_hash| stats_hash.each {
          |k,v|
          if k == :number
            numbers.push(v)
          end
        }
      }
    end
  }
  numbers
end

def player_stats(player)
  game_hash.each {
    |team,team_hash|
    team_hash[:players].each {
      |name,stats_hash| if name == player
        return stats_hash
      end
    }
  }
end

def big_shoe_rebounds
  biggest = 0
  rebounds = 0
  game_hash.each {
    |team,team_hash|
    team_hash[:players].each {
      |name,stats_hash|
      if stats_hash[:shoe] > biggest
        biggest = stats_hash[:shoe]
        rebounds = stats_hash[:rebounds]
      end
    }
  }
  rebounds
end

def most_points_scored
  most = 0
  game_hash.each{
    |team,team_hash|
    team_hash[:players].each{
      |name,stats_hash|
      if stats_hash[:points] > most
        most = stats_hash[:points]
      end
     }
  }
  game_hash.each{
    |team,team_hash|
    team_hash[:players].each{
      |name,stats_hash|
      if stats_hash[:points] == most
        return name
      end
     }
  }
end

def winning_team
  points_array = []
  game_hash.each{
    |team,team_hash|
    team_hash[:players].each{
      |name,stats_hash|
      points_array.push(stats_hash[:points])
     }
  }
  team1 = points_array.slice(0,5)
  team2 = points_array.slice(5,5)
  sum1 = 0
  team1.each { |i| sum1 += i }
  sum2 = 0
  team2.each { |j| sum2 += j }
  names = [] #tried calling previously defined method "team_names"
  game_hash.each {
    |team,team_hash|
    names.push(game_hash[team][:team_name])
  }
  if sum1 > sum2
    return names[0]
  elsif sum2 > sum1
    return name[1]
  end
end

def player_with_longest_name
  player_names = []
  game_hash.each {
    |team,team_hash|
    team_hash[:players].each {
      |name,stats_hash|
      player_names << name
    }
  }
  longest = 0
  player_names.each {
    |name|
    if name.length > longest
      longest = name.length
    end
  }
  game_hash.each {
    |team,team_hash|
    team_hash[:players].each {
      |name,stats_hash|
      if name.length == longest
        return name
      end
    }
  }
end
