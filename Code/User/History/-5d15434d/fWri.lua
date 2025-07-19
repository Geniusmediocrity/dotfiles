-- Пример строки
local input = "2: /mnt/c/Users/Лёха/.config/wezterm"

-- Используем pattern matching для извлечения номера
local number_part = input:match("^(%d+:%s?)")

-- Проверяем результат
if number_part then
	print(number_part) -- Вывод: 2:
else
	print("Номер не найден")
end