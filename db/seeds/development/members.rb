# coding: utf-8
name = %w(taro jiro hana, ichi)
fnames = ["佐藤", "田中", "山田", "高橋", "鈴木"]
gnames = ["太郎", "次郎", "一郎", "花子"]

addres = ["○県○○市○○町○ー○", "□県□□市□□町□ー□", "△県△△市△△町△ー△"]
phone = ["090-0000-0000", "080-1111-1111", "070-2222-2222", "000-9999-9999"]

0.upto(5) do |idx|
  Member.create(
{ fullname: "#{fnames[idx%5]} #{gnames[idx%4]}",
  address: "#{addres[idx%3]}",
  phone: "#{phone[idx%3]}",
  email: "#{name[idx%4]}@example.com",
  name: "#{name[idx%4]}",
  administrator: (idx == 0),
  password: "password",
  password_confirmation: "password"  
  }, without_protection: true)
end
