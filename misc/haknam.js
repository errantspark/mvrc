let rng = function(seed) {
  return function() {
    seed = (seed * 9301 + 49297) % 233280; 
    return seed
  }
}
let pwd = process.env.PWD
let pnum = parseInt(Array.prototype.slice.call(pwd).map(x => x.charCodeAt(0)%3).join(''),3)
let seed = rng(pnum)
let skyline = new Array(80).fill(0)
let lines = new Array(5).fill(0)
lines[0] = skyline.map(x => seed()/233280 > 0.5)
lines.forEach((x,i) => lines[i+1] = x.map(e=> e ? seed()/233280 > 0.01 : seed()/233280 > 0.5))
lines = lines.map(x => x.map(el => el ? '#':' ').join(''))
lines.forEach(x => console.log(x))
