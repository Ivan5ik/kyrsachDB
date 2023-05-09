class RequestsController < ApplicationController
  def index
  end 

  def get_request
    @sql = "SELECT * from cars"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end  

  def beetwen_request
    @sql = "SELECT * FROM Cars WHERE graduation_year BETWEEN 2015 AND 2020"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end

  def in_request
    @sql = "SELECT * FROM Cars WHERE type_fuel IN ('92')"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end

  def like_request
    @sql = "SELECT * FROM Clients WHERE name LIKE 'J%'"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end

  def twiceAnd_request
    @sql = "SELECT * FROM Transactions WHERE fuel_volume > 20 AND total_cost < 2000"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end 
  
  def twiceOr_request
    @sql = "SELECT * FROM Cars WHERE brand = 'Toyota' OR brand = 'Honda'"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end 
   
  def distinct_request
    @sql = "SELECT DISTINCT type_fuel FROM Cars"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end 

  def minMax_request
    @sql = "SELECT MAX(graduation_year) FROM Cars"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end 

  def sumAvg_request
    @sql = "SELECT AVG(fuel_volume) FROM Transactions"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end 

  def count_request
    @sql = "SELECT COUNT(*) FROM Cars"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end 

  def aggregatFuncFewField_request
    @sql = "SELECT client_id, COUNT(*) as num_transactions, SUM(total_cost) as total_spent, AVG(fuel_volume) as avg_fuel_volume FROM Transactions GROUP BY client_id"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end
  
  def aggregatFuncWhere_request
    @sql = "SELECT brand, AVG(engine_power) as avg_power FROM Cars WHERE graduation_year > 2018 GROUP BY brand"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end 

  def aggregatFuncWithAggregate_request
    @sql = "SELECT client_id, SUM(total_cost) FROM Transactions GROUP BY client_id HAVING SUM(total_cost) > 10000"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end
  def innerJoin_request
    @sql = "SELECT Clients.name, Loyalty_programs.name, User_loyalty_programs.count_bonus FROM User_loyalty_programs INNER JOIN Clients ON Clients.id = User_loyalty_programs.client_id INNER JOIN Loyalty_programs ON Loyalty_programs.id = User_loyalty_programs.loyalty_program_id"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end
  
  def leftJoin_request
    @sql = "SELECT Clients.id, Clients.name, Clients.surname, User_loyalty_programs.count_bonus, Loyalty_programs.name AS program_name FROM Clients LEFT JOIN User_loyalty_programs ON Clients.id = User_loyalty_programs.client_id LEFT JOIN Loyalty_programs ON User_loyalty_programs.loyalty_program_id = Loyalty_programs.id"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end

  def rightJoin_request
    @sql = "SELECT Clients.name, Loyalty_programs.name, User_loyalty_programs.count_bonus
    FROM User_loyalty_programs
    RIGHT JOIN Clients ON Clients.id = User_loyalty_programs.client_id
    RIGHT JOIN Loyalty_programs ON Loyalty_programs.id = User_loyalty_programs.loyalty_program_id"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end

  def innerJoinCondition_request
    @sql = "SELECT Clients.name, Clients.surname, User_loyalty_programs.count_bonus
    FROM Clients
    INNER JOIN User_loyalty_programs ON Clients.id = User_loyalty_programs.client_id
    WHERE User_loyalty_programs.loyalty_program_id = 1"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end

  def innerJoinLike_request
    @sql = "SELECT Users.id, Users.name, Users.surname, Loyalty_programs.name 
    FROM User_loyalty_programs 
    INNER JOIN Clients AS Users ON Users.id = User_loyalty_programs.client_id 
    INNER JOIN Loyalty_programs ON Loyalty_programs.id = User_loyalty_programs.loyalty_program_id 
    WHERE Users.surname LIKE 'Sch%'"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end

  def normalSubQuery_request
    @sql = "SELECT name, surname
    FROM Clients
    WHERE id IN (SELECT client_id FROM Transactions GROUP BY client_id HAVING COUNT(*) > 2)"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end

  def exist_request
    @sql = "SELECT *
    FROM Clients
    WHERE EXISTS (
    SELECT *
    FROM Transactions
    WHERE Transactions.client_id = Clients.id
    AND Transactions.fuel_id = 1
    )"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end

  def any_request
    @sql = "SELECT *
    FROM Transactions
    WHERE fuel_volume > ANY (
    SELECT fuel_volume
    FROM Transactions
    WHERE fuel_id = 1
    )"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end

  def inSubQuery_request
    @sql = "SELECT * FROM Cars WHERE brand IN (SELECT brand FROM Cars WHERE graduation_year = 2020)"
    @records = ActiveRecord::Base.connection.exec_query(@sql)
  end
  
end
