#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
echo $($PSQL "TRUNCATE teams, games")

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #check team is present in table or not
  if [[ $WINNER != 'winner' ]]
  then
    TEAM_ID1=$($PSQL "SELECT team_id from teams where name='$WINNER' ;")
    TEAM_ID2=$($PSQL "SELECT team_id from teams where name ='$OPPONENT';")

    if [[ -z $TEAM_ID1 ]]
    then 
      #if not present then insert
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER

      fi
      # get new team_id
      TEAM_ID=$($PSQL "SELECT team_id from teams where name='$WINNER' ;")

    fi
    if [[ -z $TEAM_ID2 ]]
    then 
      #if not present then insert
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT

      fi
      # get new team_id
      TEAM_ID=$($PSQL "SELECT team_id from teams where name ='$OPPONENT';")

    fi
  fi

done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #get winner id and oppenet id from teams table
  if [[ $WINNER != 'winner' ]]
  then
    WINNER_ID=$($PSQL "Select team_id from teams where name='$WINNER';")
    OPPONENT_ID=$($PSQL "Select team_id from teams where name='$OPPONENT';")

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS','$OPPONENT_GOALS')")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into games, $YEAR

    fi

  fi


done




  
  

