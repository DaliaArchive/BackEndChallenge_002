const MOVES = ["rock", "paper", "scissors", "spock", "lizard"]

var mod = function(a, n){
  return ((a%n)+n)%n
}

class Combat extends React.Component {
  winnerClass(movePlayer1, movePlayer2){
    var move1Index = MOVES.indexOf(movePlayer1)
    var move2Index = MOVES.indexOf(movePlayer2)

    return move1Index == move2Index ? "undecided" :
           mod(mod(move1Index - move2Index, 5), 2) == 1 ? "winner" : "loser"
  }

  personalResult(selfWinCount, adversaryWinCount){
    console.log('personal', selfWinCount, adversaryWinCount)
    if(selfWinCount > adversaryWinCount){
      return "You Won"
    } else if(selfWinCount < adversaryWinCount){
      return "You Lost"
    } else {
      return "Undecided"
    }
  }

  render(){
    const props = this.props
    var selfWinCount = 0
    var adversaryWinCount = 0

    var renderedMoves = props.movesSelf.map((moveSelf, index) => {
      const moveAdversary = props.movesAdversary[index]
      if(this.winnerClass(moveSelf, moveAdversary) === "winner"){ selfWinCount += 1 }
      if(this.winnerClass(moveAdversary, moveSelf) === "winner"){ adversaryWinCount += 1 }

      return <div key={"combat-" + index} className="combat-moves">
        <div><span className={this.winnerClass(moveSelf, moveAdversary)}>{ moveSelf }</span></div>
        <div><span className={this.winnerClass(moveAdversary, moveSelf)}>{ moveAdversary }</span></div>
      </div>
    })

    return <div className="game-content">
      <h2>{ this.personalResult(selfWinCount, adversaryWinCount) }</h2>

      <div className="combat-moves">
        <div><h3>Your Moves</h3></div>
        <div><h3>Adversary's Moves</h3></div>
      </div>
      { renderedMoves }

      <div className="combat-summary">
        <div>{ selfWinCount }</div>
        <div>{ adversaryWinCount }</div>
      </div>
    </div>
  }
}
