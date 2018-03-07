# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FinanceType.create(name: '学生学费', kind: '收入', status: '1' )
FinanceType.create(name: '员工薪资', kind: '支出', status: '1' )

