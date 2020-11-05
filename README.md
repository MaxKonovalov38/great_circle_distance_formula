# great_circle_distance_formula
## INTRODUCTION
	Поиск такси поблизости с помощью формулы расстояния по большему кругу.
## DESCRIPTION
	Зная GPS-координаты (в градусах) человека, которому необходимо такси, и координаты всех такси в городе, хранящиеся в текстовом файле в формате JSON, найдите user_id и имя всех водителей такси, доступных в близости 50 км.
## SYNOPSIS
	perl main.pl customers.json
## EXAMPLE
	Input: файл customers.json, который содержит GPS-координаты для человека, которому требуется такси
	Output: файл answers.json, который содержит user_id и имя водителей такси доступных на расстоянии 50 км.
## WEB-SAIT TASK
	https://www.geeksforgeeks.org/finding-cabs-nearby-using-great-circle-distance-formula/