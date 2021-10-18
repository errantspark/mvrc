import * as std from 'std'
'use strip';

let RNG = function(seed) {
  return function() {
    seed = (seed * 9301 + 49297) % 233280 
    return seed
  }
}
let user = std.getenv('USER')
let hostname = std.loadFile('/etc/hostname').trim()
let pnum = parseInt([...user,...hostname].map(x => x.charCodeAt(0)%3).join(''),3)
let gen = RNG(pnum)
let rng = () => gen()/233280

let blank = '    '
let aerials = ['____','_#__','_|+_','##__','__#_','_#|_','|_|_']
let blocks = ['|__=','|###','|==+','|#-#','|-##','|-_#','|*#_']

let pick = array => array[rng()*array.length|0]

let tower = height => {
  let output = new Array(height).fill(0)
  let begin = false
  let last = 0
  return output.map(_ => begin ?
      rng() > 0.2 ? last = pick(blocks) : last :
      rng() > 0.33 ? blank : ( begin = true, last = pick(blocks), pick(aerials))
  )
}

let city = new Array(20).fill(0).map(a => tower(10))

let pivot = city[0].map((a,i) => city.map((_,j)=> city[j][i])) 

print(`\nWelcome citizen \x1b[31m${user}\x1b[0m to walled city annex \x1b[31m${hostname}\x1b[0m.\n`)
print(pivot.map(a => a.join('')).join('\n')+'\n')
