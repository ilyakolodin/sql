--дз углубление в SQL

-- создание схемы БД

CREATE TABLE language (
language_name VARCHAR (50) PRIMARY KEY
)

CREATE TABLE nation (
nation_name VARCHAR (50) PRIMARY KEY
)

CREATE TABLE country (
country_name VARCHAR (50) PRIMARY KEY
)

CREATE TABLE nation_country (
nation_name VARCHAR (50) REFERENCES nation(nation_name),
country_name VARCHAR (50) REFERENCES country(country_name),
PRIMARY key (nation_name,country_name) 
)

CREATE TABLE language_nation (
language_name VARCHAR (50) REFERENCES language(language_name),
nation_name VARCHAR (50) REFERENCES nation(nation_name),
PRIMARY key (language_name, nation_name)
)

-- добавление данных

INSERT INTO language (language_name) VALUES ('language_1'),('language_2'), ('language_3'), ('language_4' ), ('language_5');

INSERT INTO nation (nation_name) VALUES ('nation_1'),('nation_2'), ('nation_3'), ('nation_4' ), ('nation_5');

INSERT INTO country (country_name) VALUES ('country_1'),('country_2'), ('country_3'), ('country_4' ), ('country_5');

INSERT INTO nation_country (nation_name, country_name) values ('nation_1','country_2'),('nation_3','country_2'),('nation_2','country_4'),('nation_5','country_4'),('nation_3','country_5')

INSERT INTO language_nation (language_name, nation_name) values ('language_1','nation_1'),('language_1','nation_2'),('language_1','nation_3'),('language_3','nation_1'),('language_3','nation_2')
