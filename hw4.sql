--дз углубление в SQL

-- создание схемы БД

CREATE TABLE language (
language_id serial PRIMARY key,
language_name VARCHAR (50)
)

CREATE TABLE nation (
nation_id serial PRIMARY key,
nation_name VARCHAR (50)
)

CREATE TABLE country (
country_id serial PRIMARY key,
country_name VARCHAR (50)
)

CREATE TABLE nation_country (
nation_id integer REFERENCES nation(nation_id),
country_id integer REFERENCES country(country_id),
PRIMARY key (nation_id,country_id) 
)

CREATE TABLE language_nation (
language_id integer REFERENCES language(language_id),
nation_id integer REFERENCES nation(nation_id),
PRIMARY key (language_id, nation_id)
)

-- для удаления таблиц
-- drop table language, nation, country, nation_country, language_nation cascade

-- добавление данных

INSERT INTO language (language_name) VALUES ('language_1'),('language_2'), ('language_3'), ('language_4' ), ('language_5');

INSERT INTO nation (nation_name) VALUES ('nation_1'),('nation_2'), ('nation_3'), ('nation_4' ), ('nation_5');

INSERT INTO country (country_name) VALUES ('country_1'),('country_2'), ('country_3'), ('country_4' ), ('country_5');

INSERT INTO nation_country (nation_id, country_id) values (1,2),(3,2),(2,4),(5,4),(3,5)

INSERT INTO language_nation (language_id, nation_id) values (1,1),(1,2),(1,3),(3,1),(3,2)

