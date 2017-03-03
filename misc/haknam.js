let rng = seed => {
  return function() {
    seed = (seed * 9301 + 49297) % 233280 
    return seed
  }
}
let pwd = process.env.PWD
let pnum = parseInt([...pwd].map(x => x.charCodeAt(0)%3).join(''),3)
let seed = rng(pnum)
let skyline = new Array(20).fill(0)
let lines = new Array(14).fill(0)
const MOD = 7
lines[0] = skyline.map(x => seed()/233280 > 0.2?0:1)
let blocks = new Array(MOD+1).fill('    ')
let tiles = ['|__=','|###','|==+','|#-#','|-##','|-_#','|*#_']
blocks.splice(0,tiles.length,...tiles)
lines.forEach((x,i) => {
  lines[i+1] = x.map(e=> {
    let next = seed()
    if (e > 0){
      return seed()/233280 > 0.2 ? next%MOD == 0 ? next%MOD+1 : next%MOD : e
    } else {
      return seed()/233280 > 0.33 ? next%MOD == MOD-1 ? MOD : next%MOD : e
    }
  })
})
lines = lines.map(x => x.map(el => blocks[MOD-el]).join(''))
//lines = lines.map(x => x.map(el => blocks[MOD-el]))
//lines = lines.map(x=> x.map(el => MOD-el))
lines.forEach(x => console.log(x))
