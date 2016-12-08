
num=10
console.log(num)
obj= {
  a: 13,
  b: 'abc',
  fun: ->
    @a
}

myfunc=()->
  num += 5
  console.log("函数:" + obj.a)
  console.log("函数:" + obj.fun())

result=myfunc()
console.log(result)

myfunc2 = (name,age=20) ->
  console.log(name+" "+age)
myfunc2('tom')

str = 'abc'
isRight = true
str+='123' if isRight

console.log(str)


if str is 'abc'
  str+='123'
else
  str+='abc'
console.log(str)

str=='abc' ? str+='123' : str+='abc'

console.log(str)

arr = [1,21,15,3,11,5,3]

for item in arr
  if 0<item<10
    console.log(item)