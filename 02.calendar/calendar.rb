require "Date"
require "optparse"

# オプションを設定する
opt = OptionParser.new
settings = {}
opt.on("-y [VAL]", "--year [VAL]", "input year") { |v| settings[:year] = v }
opt.on("-m [VAL]", "--month [VAL]", "input month") { |v| settings[:month] = v }
opt.parse!(ARGV)

# Dateクラスのインスタンス
# オプションで引数が渡されてないときは今年・今月でつくり、
# 引数が入ってるときはその値でつくる
if settings.empty?
  date = Date.today
  year = date.year
  month = date.month
else
  year = settings[:year].to_i
  month = settings[:month].to_i
  date = Date.new(year, month)
end

# カレンダーのヘッダー部分
header = date.strftime("%-m月 %Y")
puts header.center(20)

# カレンダーの曜日部分
weeks = ["日", "月", "火", "水", "木", "金", "土"]
puts weeks.join(" ")

# カレンダーの日付部分
# 月の初日の曜日を取得(月曜を1番目として何番目か？)
firstday_week_number = Date.new(year, month, 1).wday
# 月の最後の日にちを取得
lastday_date = Date.new(year, month, -1).day
# 曜日番号の分だけ空白を出力して表示を整える
print "   " * firstday_week_number
# 改行カウント用
new_line = firstday_week_number

(1..lastday_date).each do |date|
  print date.to_s.rjust(2) + " "
  new_line += 1
  if new_line % 7 == 0
    print "\n"
  end
end

