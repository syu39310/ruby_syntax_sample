# https://www.techscore.com/tech/Ruby/Lang/
# Ruby入門を参考にして作成
puts "# Hello world"
puts "Hello! Ruby"

# 変数は型宣言がいらない
puts "# 変数"
a = 1
puts a
# 動的型付けなので数値が入っていた変数に文字列を代入可能
puts "# 動的型付け検証 数値→文字列"
a = "a"
puts a

# nil=null
# nilはpオプションで出力可能
puts "# nil"
puts nil
p nil

# 式展開 文字列内への式の埋め込み #{}内は式を書ける
puts "# 式展開"
puts "1+1=#{1+1}"

# 定数は大文字始まり
# 慣習として定数は大文字のスネークケース
puts "# 定数"
CONST = 1
puts CONST

# 配列
# []で生成 or Array.new(size-0, val=nil)で生成
puts "# 配列"
values = [1,2,3]
puts "puts :#{values}"
p "p :#{values}"

# 配列アクセス
puts "# 配列アクセス"
values = ["a", "b", "c", "d", "e"]
p values[-1]   # e マイナスは後ろから
p values[0]    # a
p values[1]    # b
p values[0..3] # ["a", "b", "c", "d"]
p values[0, 3] # ["a", "b", "c"]

# 配列挿入 & 置換
puts "# 配列挿入 & 置換"
values = ["a", "b", "c", "d", "e"]
values[0] = "A"
values[1, 2] = ["B", "C"]
values[5, 0] = "F"
values.unshift("--")
values.push("G")
values << "F"
p values

# 配列要素削除
puts "# 配列要素削除"
values = ["a", "b", "c", "d", "e"]
values.delete("a")
values.delete_at(1)
values.shift # 先頭削除
values.pop   # 末尾削除
p values

# 演算子
puts "# 演算子"
p (true && true and false)
p (true || true or false)
p !true 

# if
puts "# if"
value = 1
if value == 1
  puts "#1: #{value}"
elsif value == 2
  puts "#2: #{value}"
else
  puts "#3: #{value}"
end

# unless
puts "# unless ifの逆バージョン"
puts "# elsif は無い"
value = 1
unless value == 1
  puts "#1: #{value}"
else 
  puts "#2: #{value}"
end

# case
puts "# case"
value = 2
case value
when 1
  puts "1"
when 2
  puts "2"
when 3, 4
  puts "3"
else
  puts "4"
end

# 修飾子
puts "# 修飾子"
puts "# if指定の場合は条件一致で代入"
puts "# unlessはその逆"
value = 1
value = 2 if false
puts value
value = 3 unless false
puts value

# 3項演算子
puts "# 3項演算子"
value = 1
value = value != 1 ? 2 : 3
puts value

# loop
puts "# loop"
cnt = 0
loop do
 cnt += 1
 puts cnt
 break if cnt ==3
end

# while
puts "# while"
cnt = 0
while cnt <= 3
  cnt += 1
  puts cnt
end
puts "while修飾子"
cnt += 1 while cnt <= 7
puts cnt

# until
puts "# until"
puts "# whileの判定逆バージョン"
cnt = 0
until cnt >= 3
  cnt += 1
  puts cnt
end
puts "until修飾子"
cnt += 1 until cnt >= 7
puts cnt

# for
puts "# for"
values = [1,2,3]
for value in values
 puts value
end

# ループから脱出
puts "# ループから脱出"
puts "# break: ループから抜ける"
puts "# next: 次の繰り返しへ"
puts "# break: 同じ繰り返しを行う"
values = [1,2,3,4]
cnt = 0
for value in values
  if value == 1
    next
  end
  if value == 2 and cnt <= 2
    cnt += 1
    puts "redo: #{value}"
    redo
  end
  if value == 3
    break
  end 
  puts "inner: #{value}"
end
puts "#{value}"

# メソッド
puts "# メソッド"
puts "# 命名規約: 先頭英子文字始まり、スネークケース"
puts "# boolean 返却時は末尾「?」が一般的"
def test_method(arg1)
  puts arg1
end

test_method(1)

# 戻り値
puts "# 戻り値"
puts "return で指定"
puts "指定なしの場合は、最後の式の結果が戻り値となる"
def add_value(arg1, arg2)
  arg1 + arg2
end
puts add_value(1,2)

# 引数デフォルト値
puts "# 引数デフォルト値"
def add_value(arg1=1, arg2=2)
  arg1 + arg2
end

puts add_value

# 可変長引数
puts "# 可変長引数"
def add_value(arg1, *args)
  sum = arg1
  for value in args
    sum += value
  end
  sum
end

puts add_value 1,2,3,4

# クラス
puts "# クラス"
class Book

  # setter メソッド名の後に=をつける
  def name=(name)
    # インスタンス変数には@をつける
    # インスタンス変数は必ずプライベート
    @name=name
  end

  # getter
  def name()
    return @name
  end
end

puts "# クラス名.newでインスタンス生成"
book = Book.new
puts "# インスタンス変数初期値nil"
p book.name
book.name = "Ruby" # name setter呼び出し
p book.name

# クラス アクセサメソッド
puts "# クラス アクセサメソッド"
puts "# attr_writer: setter定義"
puts "# attr_reader: getter定義"
puts "# attr_accessor: setter、getter定義"

class Book
  attr_accessor :name
end
book = Book.new
book.name = "Ruby" # name setter呼び出し
p book.name

# クラス initialize
puts "# クラス initialize"
class Book
  attr_accessor :name
  def initialize(name="Java")
    @name=name
  end
end
puts "# デフォルト値"
book = Book.new
p book.name
puts "# 初期値設定"
book = Book.new "Ruby"
p book.name

# クラス変数 
class Book
  @@object_cnt = 0

  def self.print_cnt
    puts "生成回数: #{@@object_cnt}"
  end

  attr_accessor :name

  def initialize(name="Ruby")
    @name = name
    @@object_cnt += 1
  end
end

book = Book.new
Book.print_cnt
book = Book.new
Book.print_cnt
